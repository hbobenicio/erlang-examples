-module(logger).
-export([start/0, loop/0, log/3, info/2, warn/2, erro/2, format/1]).

%% Spawns a new Log Process
start() ->
	spawn(?MODULE, loop, []).

%% The Logger main loop function.
%% Blocks waiting for log messages, print it, confirms success and then repeat
loop() ->
	receive
		{From, {Tag, Str}} ->
			Fmt = format(Tag),
			io:format(Fmt, [Str]),
			From ! {self(), ok},
			loop();

		terminate ->
			ok
	end.

%% General log function.
%% Outputs the Str to the STDOUT
%% > log(Log, info, "OK").
%% [INFO] OK
log(Pid, Tag, Str) ->
	Pid ! {self(), {Tag, Str}},
	receive
		{Pid, ok} -> ok
	end.

%% Api for logging
info(Pid, Str) -> log(Pid, info, Str).
warn(Pid, Str) -> log(Pid, warn, Str).
erro(Pid, Str) -> log(Pid, error, Str).

% Gets a format string from supported tags
format(info) -> "[INFO] ~p~n";
format(warn) -> "[WARN] ~p~n";
format(error) -> "[ERROR] ~p~n";
format(_) -> "~p~n".

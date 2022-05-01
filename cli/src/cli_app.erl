-module(cli_app).
-behaviour(application).
-export([start/2, stop/1]).

start(normal, _Args) ->
    io:format("Hello, CLI OTPP Application!~n", []),
    ok.

stop(_State) -> ok.

-module(cli).
-export([version/0]).

-spec version() -> string().
version() ->
    "0.0.1-rc.1".

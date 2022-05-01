{ application
, cli
, [ {description, "a simple cli otp application example in erlang"}
  , {vsn, "0.0.1"}
  , {modules, [cli, cli_app]}
  , {registered, [cli]}
  , {applications, [kernel, stdlib] }
  , {mod, {cli_app, []}}
  ]
}.

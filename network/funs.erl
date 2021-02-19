%% vim: set number noai ts=2 sw=2:
%% but $MYVIMRC (e: $HOME/.vimrc)
%% must be set with values:
%% set modeline
%% set modelines=5


-module(funs).
-export([start/0]).
start() ->
	PID = spawn(fun() -> loop(1) end),
	io:format("~w Lets send some messages to ~w~n", [self(), PID]),
	PID ! fun(X) -> 2*X end,
	io:format("~w Lets send some messages to ~w~n", [self(), PID]),
	PID ! fun(X) -> 2*X end,
	PID ! foo,
	PID ! fun foo/1,
	PID ! fun(X) -> 3*X end,
	ok.

foo(X) -> X*X.

loop(N) ->
	receive
		X when is_atom(X) ->
			io:format("~w atom ~w received~n", [self(), X]),
			loop(N);
		Fun when is_function(Fun,1) ->
			Y = Fun(N),
			io:format("~w Fun(~w) = ~w~n", [self(), N, Y]),
			loop(N+1)
	end.

%% Try in erl shell:
%% c(funs).
%% funs:start().
%%

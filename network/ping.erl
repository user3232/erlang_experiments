%% vim: set number noai ts=4 sw=4:
%% but $MYVIMRC (e: $HOME/.vimrc)
%% must be set with values:
%% set modeline
%% set modelines=5

-module(ping).
-export([start/1]).
%% All functions used by spawn/3 must be exported.
-export([worker/1]).

start(N) ->
	io:format("~p Parent process started.~n", [self()]),
	[spawn(?MODULE, worker, [self()]) || _ <- lists:seq(1, N)], 
	parent(N).

parent(0) ->
	io:format("~p Received ping from all workers.~n", [self()]);
parent(N) ->
	receive
		{ping, From} ->
			io:format("~p Ping from worker ~p.~n", [self(), From]),
			From ! {pong, self()},
			parent(N-1)
	end.
worker(Parent) ->
	io:format("~p Worker started.~n", [self()]),
	Parent ! {ping, self()},
	receive
		{pong, From} ->
			io:format("~p Pong from parent ~p.~n", [self(), From])
	end.


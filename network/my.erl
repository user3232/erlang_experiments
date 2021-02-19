-module(my).
%%-export([fac/1, fact/1, pyth/2, guess1/1, guess2/1, what/1]).
-compile(export_all).


list_info([]) ->
    io:format("Empty list [].~n");
list_info([H|T] = L) ->
    io:format("List ~w with head ~w and tail ~w.~n",[L,H,T]).

repeat(0) -> ok;
repeat(N) ->
    io:format("N = ~w~n", [N]),
    repeat(N-1).

gen_Seq() -> lists:seq(1,10).

list_comprehensions() -> [2*X || X <- lists:seq(1,10)].

map_ex() -> lists:map(fun(X) -> 2*X end, gen_Seq()).



%% not tail recur
fac(0) -> 1;
fac(N) when N>0 -> N*fac(N-1).


%% tail recur
fact(0)            -> 1;
fact(N) when N > 0 -> fact(N,1).

% second function with same name but diff arity
fact(0,A)           -> A;
fact(N,A)           -> fact(N-1,N*A).

pyth(A,B) ->
A2 = A*A,
B2 = B*B,
C2 = A2 + B2,
math:sqrt(C2).



guess1(42) ->
    correct;
guess1(_) ->
    wrong.


guess2(N) ->
    case N of
	42 ->
	    correct;
	_  ->
	    wrong
    end.

what(X) ->
    case X of
	{A, B} when A+B > 100 ->
	    {huge_tuple, A, B};
	{A, B} ->
	    {tuple, A, B};
	[H|T] ->
	    {list, H, T};
	X ->
	    {unknown, X}
    end.

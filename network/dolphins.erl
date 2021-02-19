%% vim: set number noai ts=4 sw=4:
%% but $MYVIMRC (e: $HOME/.vimrc)
%% must be set with values:
%% set modeline
%% set modelines=5

-module(dolphins).
-compile(export_all).

dolphin() ->
	receive
		do_a_flip -> 
			io:format("How about no?~n"),
			dolphin(); %% loop
		fish ->
			io:format("So long and thanks!~n");
		_ ->
			io:format("Heh, we're smarter than you hmans.~n"),
			dolphin() %% loop
	end.




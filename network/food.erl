%% vim: set number noai ts=2 sw=2:
%% but $MYVIMRC (e: $HOME/.vimrc)
%% must be set with values:
%% set modeline
%% set modelines=5

%% there are 4 processes
%% store - have food
%% boss  - sometimes gives food to store
%% eater - eats food from store
%% os    - creates and monitor situation
%%              situation ends when no more food in store
%%
%% every process (without os monitor) randomises
%% some of its parameters and then enters loop.


store_run(Food_state) ->
	%% per process random service initial seed:
	random:seed(erlang:now()),
	store_service(Food_state).

%% store_service(Food_state)->ok
%% Food_state = [string()]
store_service(
	


-module(ws_handler).
-export([init/2, websocket_handle/2]).

init(Req, State) ->
    {cowboy_websocket, Req, State}.

websocket_handle({text, Message}, State) ->
    {[{text, lists:reverse(binary_to_list(Message))}], State};

websocket_handle(_Frame, State) ->
    {ok, State}.

-module(teeth).
-export([alert/0]).

getPocketDepths() ->
    [[0], [2,2,1,2,2,1], [3,1,2,3,2,3],
[3,1,3,2,1,2], [3,2,3,2,2,1], [2,3,1,2,1,1],
[3,1,3,2,3,2], [3,3,2,1,3,1], [4,3,3,2,3,3],
[3,1,1,3,2,2], [4,3,4,3,2,3], [2,3,1,3,2,2],
[1,2,1,1,3,2], [1,2,2,3,2,3], [1,3,2,1,3,3], [0],
[3,2,3,1,1,2], [2,2,1,1,3,2], [2,1,1,1,1,2],
[3,3,2,1,1,3], [3,1,3,2,3,2], [3,3,1,2,3,3],
[1,2,2,3,3,3], [2,2,3,2,3,3], [2,2,2,4,3,4],
[3,4,3,3,3,4], [1,1,2,3,1,2], [2,2,3,2,1,3],
[3,4,2,4,4,3], [3,3,2,1,2,3], [2,2,2,2,3,3],
[3,2,3,2,3,2]].

%% @doc Create a list of tooth numbers that require attention

-spec(alert() -> [integer()]).

alert() ->
    PocketDepths = getPocketDepths(),
    alert(PocketDepths, 1, []).

%% @doc Helper function that accumulates the list of teeth needing attention

-spec(alert([integer()], integer(), [integer()]) -> [integer()]).

alert([], _ToothNumber, Result) -> lists:reverse(Result);

alert([H | T], ToothNumber, Result) ->
    case stats:maximum(H) >= 4 of
        true  -> alert(T, ToothNumber + 1, [ToothNumber | Result]);
        false -> alert(T, ToothNumber + 1, Result)
    end.






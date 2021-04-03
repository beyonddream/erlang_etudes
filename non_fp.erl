-module(non_fp).
-export([generate_teeth/2]).

generate_teeth(TrueOrFalse, GoodToothProbability) ->
    random:seed(now()),
    generate_teeth(TrueOrFalse, GoodToothProbability, []).

generate_teeth([], _GoodToothProbablity, A) -> lists:reverse(A);

generate_teeth([H | Rest], GoodToothProbability, A) ->
    Tooth = case H of
        $T -> generate_tooth(GoodToothProbability);
        $F -> [0]
    end,
    generate_teeth(Rest, GoodToothProbability, [Tooth | A]).

generate_tooth(GoodToothProbability) ->
    Rand = random:uniform(),
    io:fwrite("Rand is ~p~n", [Rand]),
    BaseDepth = case Rand < GoodToothProbability of
        true  -> 2;
        false -> 3
    end,
    generate_tooth(BaseDepth, 6, []).

generate_tooth(_BaseDepth, 0, A) -> A;

generate_tooth(BaseDepth, LeftToGenerate, A) ->
    X = random:uniform(3),
    io:fwrite("X is ~p~n", [X]),
    Add = X - 2,
    %generate_tooth(BaseDepth, LeftToGenerate - 1, [BaseDepth + Add | A]).
    [BaseDepth + Add | generate_tooth(BaseDepth, LeftToGenerate - 1, A)].
            

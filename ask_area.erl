-module(ask_area).
-export([area/0]).

area() ->

    Answer = io:get_line("R)ectangle, T)riangle, or E)llipse > "),
    Shape  = char_to_shape(hd(Answer)),
    Numbers = case Shape of
        rectangle -> get_dimensions("width", "height");
        triangle  -> get_dimensions("base", "height");
        ellipse   -> get_dimensions("major axis", "minor axis");
        unknown   -> {error, "Unknown shape " ++ [hd(Answer)]}
    end,

    Area = calculate(Shape, element(1, Numbers), element(2, Numbers)),
    Area.

char_to_shape (Char) ->
    case Char of
       $R -> rectangle;
       $r -> rectangle;
       $T -> triangle;
       $t -> triangle;
       $E -> ellipse;
       $e -> ellipse;        
        _ -> unknown
    end.

get_number (Prompt) ->
    Str = io:get_line("Enter " ++ Prompt ++ " > "),
    {Test, _} = string:to_float(Str),
    {N, _} = case Test of
        error -> string:to_integer(Str);
        _ -> {Test, ignore}
    end,
    N.
    
get_dimensions (Prompt1, Prompt2) ->
    N1 = get_number(Prompt1),
    N2 = get_number(Prompt2),
    {N1, N2}.

calculate(unknown, _, Err) -> io:format("~s~n", [Err]);
calculate(_, error, _) -> io:format("Error in first number.~n");
calculate(_, _, error) -> io:format("Error in second number.~n");
calculate(_, A, B) when A < 0; B < 0 ->
    io:format("Both numbers must be greater than or equal to zero~n");
calculate(Shape, A, B) -> geom4_1:area(Shape, A, B).

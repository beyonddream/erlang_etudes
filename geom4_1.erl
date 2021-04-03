-module(geom4_1).
-export([area/3]).

%% @doc Calculates the area of a shape, given the
%% shape and two of the dimensions. Returns the product
%% of its arguments for a rectangle, one half the
%% product of the arguments for a triangle, and
%% math:pi times the product of the arguments for
%% an ellipse.

-spec(area(atom(), number(), number()) -> number()).

area(Shape, Dim1, Dim2) when Dim1 >= 0, Dim2 >= 0 ->
    case Shape of 
        rectangle -> Dim1 * Dim2;
        triangle  -> (Dim1 * Dim2) / 2.0;
        ellipse   -> math:pi() * Dim1 * Dim2
    end.



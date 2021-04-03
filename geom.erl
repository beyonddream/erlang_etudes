%% @author Arun S.K <arunsk.tec@gmail.com>
%% @doc Functions for calculating areas of geometric shapes.
%% @copyright 2014 Arun S.K
%% @version 0.1

-module(geom).
-export([area/2]).


%% @doc Calculates the area of a rectangle, given the
%% length and width. Returns the product
%% of its arguments.

-spec(area(number(), number()) -> number()).

area (Length, Width) ->
    Length * Width.

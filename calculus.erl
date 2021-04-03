-module(calculus).

-export([derivative/2]).

-spec(derivative(function(), float()) -> float()).

derivative(Fn, X) ->
    Delta = 1.0e-10,
    (Fn(X + Delta) - Fn(X))/Delta.



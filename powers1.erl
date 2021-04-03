-module(powers1).
-export([raise/2, nth_root/2]).

raise(_, 0) -> 1;
raise(X, N) when N < 0 -> 1.0 / raise(X, -N);
raise(X, N) when N > 0 -> raise(X, N, 1).

raise(_, 0, A) -> A;
raise(X, N, A) ->
 raise(X, N - 1, X * A).

nth_root(X, N) -> nth_root(X, N, X / 2.0).

nth_root(X, N, A) ->
    io:format("Current guess is ~p~n", [A]),
    F = raise(A, N) - X,
    Fprime = N * raise(A, N - 1),
    Next = A - F / Fprime,
    Change = abs(Next - A),
    Diff = Change - 1.0 * raise(10, -8),
    if 
        Diff < 0  -> Next;
        true -> nth_root(X, N, Next)
    end.
    

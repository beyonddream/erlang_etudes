-module(dates).
-export([date_parts/1, julian/1]).

-spec(date_parts(list()) -> list()).

date_parts(DateStr) ->
    [YStr, MStr, DStr] = re:split(DateStr, "-", [{return, list}]),
    [element(1, string:to_integer(YStr)),
     element(1, string:to_integer(MStr)),
     element(1, string:to_integer(DStr))].

%julian (ISODate) ->
%    [Year, Month, Day] = date_parts(ISODate),
%    DaysInFeb = 
%        case is_leap_year(Year) of
%            true  -> 29;
%            false -> 28
%        end,
%    DaysPerMonth = [31, DaysInFeb, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
%    julian (Year, Month, Day, DaysPerMonth, 0).

%julian (Year, Month, Day, DaysPerMonth, A) ->
%    [H | T] = DaysPerMonth,
%    DaysPerMonth_len = length(DaysPerMonth),
%    %io:format("here in true ~p , ~p~n", [DaysPerMonth_len, Month]),
%    case Month > (13 - DaysPerMonth_len) of
%        true  -> julian (Year, Month, Day, T, A + H);
%        false   -> A + Day
%    end.

julian(DateStr) ->
    DaysPerMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
    [Y, M, D] = date_parts(DateStr),
    {Sublist, _} = lists:split(M - 1, DaysPerMonth),
    Total = lists:foldl(fun(V, A) -> V + A end, 0, Sublist),
    case M > 2 andalso is_leap_year(Y) of
        true  -> Total + D + 1;
        false -> Total + D
    end.

is_leap_year(Year) ->
    (Year rem 4 == 0 andalso Year rem 100 /= 0)
    orelse (Year rem 400 == 0).

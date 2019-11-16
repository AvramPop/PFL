/*
A player wants to choose the predictions for 4 games.
The predictions can be 1, X, 2.
Write a predicate to generate all possible variants considering that:
last prediction can’t be 2 and no more than two possible predictions X.
*/
/*
o(o).
o(o : integer)
*/
o(1).
o(2).
o(x).

/*
comb(i, o, o)
comb(N: integer, L: list, C: integer)
*/
comb(1, [x], 1).
comb(1, [1], 0).
comb(N, [X | T], C) :-
              N1 is N - 1,
              N1 > 0,
              o(X),
              comb(N1, T, C1),
              X \== x,
              C is C1.
comb(N, [X | T], C) :-
              N1 is N - 1,
              N1 >= 0,
              o(X),
              comb(N1, T, C1),
              X == x,
              C is C1 + 1,
              C < 3.

/*
combWrapper(o)
combWrapper(R: list)
*/
combWrapper(R) :- comb(4, R, _).

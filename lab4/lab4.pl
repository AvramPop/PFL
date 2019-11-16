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
o(3). % 3 represents x


/*
comb(i, i, i, o).
comb(N : integer, P : integer, Temp : list, Rez : list).
*/
comb(4, _, Temp, Temp) :- !.
comb(N, P, Temp, Rez) :-
					o(X),
					N1 is N + 1,
					P1 is P * X,
					P1 mod 27 =\= 0,
					comb(N1, P1, [X | Temp], Rez).

/*
predictionsAux(o)
predictionsAux(R : list)
*/
predictionsAux(R) :- comb(1, 1, [1], R).
predictionsAux(R) :- comb(1, 3, [3], R).

/*
predictions(o)
predictions(R : list)
*/
predictions(RF) :- predictionsAux(R), formatX(R, RF).

/*
formatX(i, o)
formatX(i: list, o: list)
formatX(l1...ln) =
	0, n = 0
	'x' + formatX(l2..ln), l1 = 3
	l1 + formatX(l2..ln), otherwise

*/
formatX([], []) :- !.
formatX([X | T], [x | Rez]) :- X == 3, !, formatX(T, Rez).
formatX([X | T], [X | Rez]) :- formatX(T, Rez).

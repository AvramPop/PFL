/*
A player wants to choose the predictions for 4 games. 
The predictions can be 1, X, 2. 
Write a predicate to generate all possible variants considering that:   
last prediction can’t be 2 and no more than two possible predictions X.
*/
/*
o(1).
o(2).
o(x).
*/
/*comb(1, [E]) :- o(E), E \== 2.
comb(1, [X], C) :- o(X), 
				X \== 2, 
				X == x, 
				C is 1.
comb(1, [X], C) :- o(X), 
				X \== 2, 
				C is 0.
comb(N, [X | T], C) :-
				N1 is N - 1,
				N1 > 0,
				o(X),
				comb(N1, T, C1),
				X \== x,
				C is C1,
				write("First branch "), write(X), write(" "), write(C), nl.
comb(N, [X | T], C) :- 
				N1 is N - 1,
				N1 >= 0,
				o(X),
				comb(N1, T, C1),
				C is C1 + 1, 
				write("Second branch "), write(X), write(" "), write(C), nl.*/
				
/*
%predictions(R) :- comb(4, R).*/


o(1).
o(2).
o(3). % 3 represents x

comb(4, _, Temp, Temp) :- !.
comb(N, P, Temp, Rez) :-
					o(X), 
					N1 is N + 1,
					P1 is P * X,
					P1 mod 27 =\= 0,
					comb(N1, P1, [X | Temp], Rez).

predictions(R) :- comb(1, 1, [1], R).
predictions(R) :- comb(1, 3, [3], R).

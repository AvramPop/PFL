/*
prime(i)
prime(I : integer)
*/
prime(2) :- !.
prime(X) :- M is X mod 2, M =:= 0, !, fail.
prime(X) :- X < 2, !, fail.
prime(X) :- primeAux(X, 3).


/*
primeAux(i, i)
primeAux(I: integer, D: integer)
*/
primeAux(X, D) :- H is X // 2, D > H, !.
primeAux(X, D) :- M is X mod D, M =:= 0, !, fail.
primeAux(X, D) :- D1 is D + 1, primeAux(X, D1).

/*
removePrimes(i, o)
removePrimes(L: list, R: list)
*/
removePrimes([], []) :- !.
removePrimes([E], [E]) :- !.
removePrimes([H1, H2], [H1, H2]) :- not(prime(H1)), not(prime(H2)), !.
removePrimes([H1, H2], [H1, H2]) :- not(prime(H1)), prime(H2), !.
removePrimes([H1, H2], [H1, H2]) :- prime(H1), not(prime(H2)), !.
removePrimes([H1, H2], []) :- prime(H1), prime(H2), !.
removePrimes([H1, H2, H3 | List], R) :- prime(H1), prime(H2), prime(H3), !, removePrimes([H2, H3 | List], R).
removePrimes([H1, H2, H3 | List], R) :- prime(H1), prime(H2), not(prime(H3)), !, removePrimes([H3 | List], R).
removePrimes([H1, H2, H3 | List], R) :- not(prime(H1)), prime(H2), prime(H3), !, removePrimes([H1, H3 | List], R).
removePrimes([H1, H2, H3 | List], [H1, H2 | R]) :- not(prime(H1)), not(prime(H2)), prime(H3), !, removePrimes([H3 | List], R).
removePrimes([H1, H2, H3 | List], [H1, H2, H3 | R]) :- removePrimes(List, R).

gcd(A, 0, A) :- !.
gcd(A, B, C) :- R is A mod B, gcd(B, R, C).

lcm(A, B, R) :- P is A * B, gcd(A, B, GCD), R is P / GCD.

add(_, _, _, [], Temp, Temp) :- !.
add(V, I, P, [H | List], Temp, Rez) :- I1 is I + 1, I1 =:= P, !, P1 is P * 2, concat_lists(Temp, [H], Temp1), concat_lists(Temp1, [V], Temp2), add(V, I1, P1, List, Temp2, Rez).
add(V, I, P, [H | List], Temp, Rez) :- I1 is I + 1, concat_lists(Temp, [H], Temp1), add(V, I1, P, List, Temp1, Rez).

concat_lists([], [], []) :- !.
concat_lists(A, [], A) :- !.
concat_lists([], B, B) :- !.
concat_lists([H | A], B, [H | Rez]) :-
					concat_lists(A, B, Rez).

occ([], _, 0) :- !.
occ([H | T], E, R) :- H =:= E, !, occ(T, E, R1), R is R1 + 1.
occ([_ | T], E, R) :- occ(T, E, R).

belongs(E, [E | _]) :- !.
belongs(E, [_ | T]) :- belongs(E, T).

pairs(_, [], []) :- !.
pairs(E, [H | List], [[E, H] | Rez]) :- pairs(E, List, Rez). 

pairsA([], []) :- !.
pairsA([H | List], C) :- pairs(H, List, Temp), 
					pairsA(List, Rez), 
					concat_lists(Temp, Rez, C).

remove(_, _, [], Temp, Temp) :- !.
remove(E, C, [H | L], Temp, Rez) :- H =:= E, C1 is C + 1, C1 < 4, !, remove(E, C1, L, Temp, Rez).
%remove(E, C1, [H | L], [H | Rez]) :- H =:= E, remove(E, C, L, Rez), C1 is C + 1, C1 < 3, !. 
remove(E, C, [H | L], Temp, Rez) :- concat_lists(Temp, [H], R), remove(E, C, L, R, Rez).

even_list([]).
even_list([_, _ |T]) :- even_list(T).

sub_list([], _, _, _, Temp, Temp) :- !.
sub_list([H | A], I, M, N, Temp, Rez) :- I >= M, I =< N, !, I1 is I + 1, concat_lists(Temp, [H], R), sub_list(A, I1, M, N, R, Rez).
sub_list([_ | A], I, M, N, Temp, Rez) :- I1 is I + 1, sub_list(A, I1, M, N, Temp, Rez).

is_mountain([L1, L2, L3 | T]) :- L1 < L2, L2 > L3, !, is_mountain([L2, L3 | T]).
is_mountain([L1, L2, L3 | T]) :- L1 < L2, L2 < L3, !, is_mountain([L2, L3 | T]).
is_mountain([L1, L2, L3 | T]) :- L1 > L2, L2 > L3, !, is_mountain([L2, L3 | T]).
is_mountain([L1, L2]) :- L1 > L2.


merge_lists([], [], [], []) :- !.
merge_lists(A, [], Temp, Rez) :- !, concat_lists(Temp, A, Rez).
merge_lists([], B, Temp, Rez) :- !, concat_lists(Temp, B, Rez).
merge_lists([H1 | A], [H2 | B], Temp, Rez) :- H1 < H2, !, concat_lists(Temp, [H1], Temp1), merge_lists(A, [H2 | B], Temp1, Rez).
merge_lists(A, [H2 | B], Temp, Rez) :- concat_lists(Temp, [H2], Temp1), merge_lists(A, B, Temp1, Rez).

list_length([], 0) :- !.
list_length([_ | T], C) :- list_length(T, C1), C is C1 + 1.

split(_, _, [], L, L, R, R) :- !.
split(I, M, [H | List], L, LR, R, RR) :- I1 is I + 1, TM is M + 1, I < TM, !, concat_lists(L, [H], Temp), split(I1, M, List, Temp, LR, R, RR).
split(I, M, [H | List], L, LR, R, RR) :- I1 is I + 1, concat_lists(R, [H], Temp), split(I1, M, List, L, LR, Temp, RR). 

splitF([], [], []) :- !.
splitF(List, L, R) :- list_length(List, Tm), M is Tm / 2, split(1, M, List, [], L, [], R).

sort_list([], []) :- !.
sort_list([E], [E]) :- !.
sort_list(List, Sorted) :-
	splitF(List, L, R),
	sort_list(L, TL), 
	sort_list(R, TR), 
	merge_lists(TL, TR, [], Sorted). 
	
prime(X) :- X < 2, !, fail.
prime(2) :- !.
prime(X) :- X mod 2 =:= 0, !, fail.
prime(X) :- primeAux(X, 3).
primeAux(X, D) :- H is X / 2, D >= H, !.
primeAux(X, D) :- X mod D =:= 0, !, fail.
primeAux(X, D) :- D1 is D + 2, primeAux(X, D1).			

con([], Temp, Temp) :- !.
con([E], Temp, Rez) :- concat_lists(Temp, [E], Rez), !.
con([H1, H2 | List], Temp, Rez) :- H1 =:= H2 - 1, !, con([H2 | List], Temp, Rez).
con([H1, H2 | List], Temp, Rez) :- concat_lists(Temp, [H1, H2], R), con(List, R, Rez).
				 

child(martha,charlotte).
child(charlotte,caroline).
child(caroline,laura).
child(laura,rose).
   
descend(X,Y)  :-  child(X,Y).
descend(X,Y)  :-  child(X,Z), descend(Z,Y).

powerset(S, L) :- findall(R, subset(S, R), L).
subset([], []) :- write("empty clause"), nl.
subset([_ | T], R) :- write("first clause"), nl, subset(T, R).
subset([E | T], [E | R]) :- write("second clause"), nl, subset(T, R).

wrt(N) :- write(N), nl, N1 is N + 1, wrt(N1).

create(N, tree(N, empty, empty)).
insertL(X, tree,(N, _, R), tree(N, X, R)).
insertR(X, tree(N, L, _), tree(N, L, X)).
go(Res) :- 
	create(A, A1),
	create(B, B1), 
	create(C, C1), 
	create(D, D1), 
	insertL(D1, C1, C2), 
	insertR(C2, A1, A2), 
	insertL(B1, A2, Res).
	
traverse(empty).
traverse(tree(N, L, R)) :- 
					write(N), nl,
					traverse(L), 
					traverse(R).
					
					
					
pairs([A | L], X) :- 
				pairs2(A, L, X).
pairs([_ | L], X) :-
				pairs(L, X).
				
pairs2(A, [B| _], [A | B]) :- A < B.
pairs2(A, [_ | L], X) :- pairs2(A, L, X).
					
					
combS([E | _], E, [E]).
combS([E | T], S, [E | R]) :-
						E < S, 
						S1 is S - E,
						combS(T, S1, R).
combS([_| T], S, R) :-
				combS(T, S, R).

subs([E | _], I, [E]) :- E mod 2 =:= I . 
subs([_ | L], I, L1) :- subs(L, I, L1).
subs([A | L], I, [A | L1]) :- A mod 2 =:= 0, subs(L, I, L1).
subs([A | L], I, [A | L1]) :- A mod 2 =:= 1, I1 is I - 1, subs(L, I1, L1).

o(1).
o(2).
o(x).

comb(O, 1, [O]) :- o(O).
comb([A | L], N, [A | S]) :-
						N1 is N - 1,
						N1 > 0,
						comb([A | L], N1, S).
/*comb([_ | L], N, S) :- 
					comb(L, N, S).
*/
predictions(R) :- comb([1, 2, x], 4, R).
				

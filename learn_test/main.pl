add(E, [], [E]) :- !.
add(E, [H | T], [H | List]) :- add(E, T, List).

sum([], 0).
sum([H | T], S) :- number(H), 
					!,
					sum(T, S1), 
					S is H + S1.
sum([H | T], S) :- is_list(H), 
					!,
					sum(H, S1),
					sum(T, S2),
					S is S1 + S2. 
					
sum([_ | T], S) :- sum(T, S).
					
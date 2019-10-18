%b
gcd(A, 0, A) :- !.
gcd(A, B, C) :- R is A mod B, gcd(B, R, C).

gcd_list([H], H).
gcd_list([H | T], R) :- gcd_list(T, Current), gcd(Current, H, R). 


	

%a			
is_member(E, [E | _]) :- !.
is_member(E, [_ | T]) :- is_member(E, T).
			
to_set([], []) :- !.
to_set([H | T], [H | Rez]) :- to_set(T, Rez), not(is_member(H, Rez)), !.
to_set([_ | T], Rez) :- to_set(T, Rez).

/*
transform(A, C) :- to_set(A, B), revert(B, C).

revert([], []).
revert([H | T], Rez) :- revert(T, TempRez), concat(TempRez, H, Rez).

concat([], E, [E]).
concat([H | T], E, [H | Rez]) :- concat(T, E, Rez).*/






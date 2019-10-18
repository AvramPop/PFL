/** Lists in Prolog (1)
* 13.
* a. Transform a list in a set, in the order of the last occurrences of elements. Eg.: [1,2,3,1,2] is transformed in [3,1,2].	
*/

/**
* is_member(e, l1...ln) = 
	F, n = 0
	T, e = l1
	is_member(e, l2...ln), otherwise
	
  is_member(e: number, l1...ln: list)
  is_member(i, i)
*/

/**
* to_set(l1...ln, s1...sm) = 
	0, n = 0
	to_set(l2...ln, s1...sm), l1 in s2...sm
	to_set(l2...ln, l1s1...sm), otherwise
	
  to_set(l1...ln: list, s1...sn: list)
  to_set(i, o)
  call: to_set(list, [])
  
*/
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


% b. Define a predicate to determine the greatest common divisor of all numbers in a list.

/**
	gcd(a, b, c) = 
		a, b = 0
		gcd(b, a % b, c), otherwise
	
  gcd(a: number, b: number, c: number)
  gcd(i, i, o)
*/

/**
	gcd_list(l1...ln, r) = 
		0, n = 0
		gcd(l1, gcd_list(l2...ln, r)), otherwise

  gcd_list(l1...ln: list, r: number)
  gcd_list(i, o)
*/
gcd(A, 0, A) :- !.
gcd(A, B, C) :- R is A mod B, gcd(B, R, C).

gcd_list([], 0).
gcd_list([H | T], R) :- gcd_list(T, Current), gcd(Current, H, R). 


	








/*
3.
a. Merge two sorted lists with removing the double values. 

concat_lists(a1...an, b1...bm)=
	a1...an, m = 0
	b1...bm, n = 0
	a1 + concat_lists(a2...an, b1...bm), otherwise
	
concat_lists(a1...an: list, b1...bm: list, c1...cn+m: list)
concat_lists(i, i, o)

use cases:
concat_lists([1], [2], Rez) => Rez is [1, 2]
concat_lists([], [2], Rez) => Rez is [2]
concat_lists([1], [], Rez) => Rez is [1]
concat_lists([1, 2], [2, 3], Rez) => Rez is [1, 2, 2, 3]
concat_lists([], [], Rez) => Rez is []

merge_lists(a1...an, b1...bm)=
	a1...an, m = 0
	b1...bm, n = 0
	a1 + merge_lists(a2...an, b1...bm), a1 < b1
	b1 + merge_lists(a1...an, b2...bm), otherwise
	
merge_lists(a: list, b: list, [], rez: list)
merge_lists(i, i, [], o)

use cases:
merge_lists([1, 2], [2, 3], [], Rez) => Rez is [1, 2, 2, 3]
merge_lists([1, 3], [2], [], Rez) => Rez is [1, 2, 3]
merge_lists([1, 2], [], [], Rez) => Rez is [1, 2]
merge_lists([], [2, 3], [], Rez) => Rez is [2, 3]
merge_lists([1, 1], [0, 0], [], Rez) => Rez is [0, 0, 1, 1]

is_member(e, l1...ln) = 
	T, e = l1
	F, n = 0
	is_member(e, l2...ln), otherwise
	
is_member(e: integer, l: list)
is_member(i, i)

use cases: 
is_member(1, [1, 2]) => True
is_member(1, [2]) => False
is_member(1, []) => False


to_set(l1...ln, s1...sm) = 
	0, n = 0
	to_set(l2...ln, s1...sm), l1 in s2...sm
	to_set(l2...ln, l1s1...sm), otherwise
	
  to_set(l1...ln: list, s1...sn: list)
  to_set(i, o)
  call: to_set(list, [])
  
use cases:
to_set([1, 2, 3], Rez) => Rez is [1, 2, 3]
to_set([1, 2, 2, 3], Rez) => Rez is [1, 2, 3]
to_set([3], Rez) => Rez is [3]
to_set([1, 1, 2, 2, 3, 3], Rez) => Rez is [1, 2, 3]
  
merge_to_set(a1...an, b1...bm) = 
	to_set(merge_lists(a1...an, b1...bm))
merge_to_set(a: list, b: list, rez:list)
merge_to_set(i, i, o)

use cases:
merge_to_set([1, 2], [], Rez) => Rez = [1, 2]
merge_to_set([1, 1, 2], [], Rez) => Rez = [1, 2] 
merge_to_set([], [1, 1, 2], Rez) => Rez = [1, 2]
merge_to_set([], [1, 2], Rez) => Rez = [1, 2]
merge_to_set([1, 2], [1, 2], Rez) => Rez = [1, 2]
merge_to_set([1, 2, 2, 3, 4, 4, 5], [1, 2, 3, 8, 9], Rez) => Rez = [1, 2, 3, 4, 5, 8, 9]   

*/
concat_lists([], [], []) :- !.
concat_lists(A, [], A).
concat_lists([], B, B).
concat_lists([H | A], B, [H | C]) :- concat_lists(A, B, C).

merge_lists([], [], [], []) :- !.
merge_lists(A, [], Temp, Rez) :- !, concat_lists(Temp, A, Rez).
merge_lists([], B, Temp, Rez) :- !, concat_lists(Temp, B, Rez).
merge_lists([H1 | A], [H2 | B], Temp, Rez) :- H1 < H2, !, concat_lists(Temp, [H1], Temp1), merge_lists(A, [H2 | B], Temp1, Rez).
merge_lists(A, [H2 | B], Temp, Rez) :- concat_lists(Temp, [H2], Temp1), merge_lists(A, B, Temp1, Rez).

is_member(E, [E | _]) :- !.
is_member(E, [_ | T]) :- is_member(E, T).

to_set([], Temp, Temp).
to_set([H | T], Temp, Rez) :- not(is_member(H, T)), !, concat_lists(Temp, [H], Temp1), to_set(T, Temp1, Rez).
to_set([_ | T], Temp, Rez) :- to_set(T, Temp, Rez).

merge_to_set(A, B, Rez) :- merge_lists(A, B, [], Temp), to_set(Temp, [], Rez).

/*
b. For a heterogeneous list, formed from integer numbers and list of numbers, merge all sublists with removing
the double values.
[1, [2, 3], 4, 5, [1, 4, 6], 3, [1, 3, 7, 9, 10], 5, [1, 1, 11], 8] =>
[1, 2, 3, 4, 6, 7, 9, 10, 11].

listify(A)=
	A, A is a list
	list(A), otherwise
	
listify(i, o)
listify(A: any, Rez: list)

use cases:
listify(1, R) => R is [1]
listify([1], R) => R is [1]
listify([1, 2], R) => R is [1, 2]

big_merge(l1...ln)=
	[], n = 0
	big_merge(merge_to_set(l1, l2...ln)), otherwise
	
big_merge(i, [], o)
big_merge(l: list, [], Rez: list)

use cases:
big_merge([1, 2], [], Rez) => Rez = [1, 2] 
big_merge([[1], 2], [], Rez) => Rez = [1, 2] 
big_merge([[1], [2]], [], Rez) => Rez = [1, 2] 
big_merge([[1], [2], 3], [], Rez) => Rez = [1, 2, 3] 
big_merge([[1, 2], [2], 3], [], Rez) => Rez = [1, 2, 3]
big_merge([[1, 2], [2, 2], 3], [], Rez) => Rez = [1, 2, 3] 
big_merge([[1, 2], [2, 2], 3, 1], [], Rez) => Rez = [1, 2, 3]
big_merge([[1, 2], [2, 2], 3, 1, [1, 2]], [], Rez) => Rez = [1, 2, 3]
big_merge([1, [2, 3], 4, 5, [1, 4, 6], 3, [1, 3, 7, 9, 10], 5, [1, 1, 11], 8], [], Rez) => Rez = [1,2,3,4,5,6,7,8,9,10,11] 
*/

listify(A, A) :- is_list(A), !.
listify(A, [A]). 

big_merge([], Temp, Temp).
big_merge([H | T], Temp, Rez) :- listify(H, H_listified), merge_to_set(Temp, H_listified, Temp1), big_merge(T, Temp1, Rez).

 
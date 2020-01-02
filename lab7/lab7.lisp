; 1. Write a function to check if an atom is member of a list (the list is non-liniar)
#|
orAux(l1..ln rez)=
  rez, n = 0
  orAux(l2..ln, rez or true(l1)), otherwise
orAux(list, atom)
(orAux '(t t nil) nil) => t
(orAux '(nil) nil) => nil
(orAux '(1 nil) nil) => t
|#
(defun orAux (l rez)
(cond
  ((null l) rez)
  (t (orAux (cdr l) (or rez (true (car l)))))
)
)
 #|
_or(l) = orAux(l, nil)
_or(list)
(_or '(t t nil)) => t
(_or '(nil)) => nil
(_or '(1 nil)) => t
 |#
(defun _or (l)
  (orAux l nil)
)

#|
true(a) =
  nil, a is nil
  t, otherwise
true(atom)
(true 1) => t
(true "a") => t
(true nil) => nil
|#

(defun true (a)
(cond
  ((null a) nil)
  (t t)
)
)

#|
isMember(e l1..ln)=
  t, l is atom and e = l
  nil, l is atom and e != l
  U isMember(e, li), otherwise
isMember(atom, list)
(isMember "a" '(1 "a" 3 (4))) => t
(isMember "a" '(1 3 ("a"))) => t
(isMember "a" '(1 3 (4))) => nil
(isMember 1 '(1 "a" 3 (4))) => t
|#

(defun isMember (e l)
(cond
  ((and (atom l) (equal e l)) t)
  ((atom l) nil)
  (t (_or (mapcar #'(lambda (a) (isMember e a)) l)))
)
)

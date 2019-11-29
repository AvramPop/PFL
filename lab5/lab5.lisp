; 8.
; a) Write a function to return the difference of two sets.
#|
memberOfList(el, l1..ln) =
             F, n = 0
             T, el = l1
             memberOfList(el l2..ln), otherwise
memberOfList(el: atom?, l: list)

(memberOfList '(1 2 3) 1) => T
(memberOfList '(1 2 3) 4) => nil
(memberOfList '((1) 2 3) 1) => nil
(memberOfList '(() 1)) => nil
|#
(defun memberOfList(l e)
  (cond
    ((null l) nil)
    ((= (car l) e) T)
    (T (memberOfList (cdr l) e))
  )
)
#|
setDifference(s11..s1n, s21..s2m) =
             [], n = 0
             s11 + setDifference(s12..s1n, s21..s2m), s11 not in s21..s2m
             setDifference(s12..s1n, s21..s2m), otherwise
setDifference(s11..s1n: set, s21..s2n: set)

(setDifference '(1 2 3) (2 3 4)) => (1)
(setDifference '() (2 3 4)) => nil
(setDifference '(2) (2)) => nil
|#
(defun setDifference(s1 s2)
  (cond
    ((null s1) nil)
    ((not (memberOfList s2 (car s1))) (cons (car s1) (setDifference (cdr s1) s2)))
    (T (setDifference (cdr s1) s2))
  )
)

; b) Write a function to reverse a list with its all sublists, on all levels.
#|
pushBack(l1..ln, e) =
         e, n = 0
         l1..ln + e, otherwise
pushBack(l: list, e: atom)
(pushBack '(1 2 3) 5) => (1 2 3 5)
(pushBack '() 5) => (5)
|#
(defun pushBack(l e)
  (cond
    ((null l) e)
    (T (cons (car l) (pushBack (cdr l) e)))
  )
)

#|reverseList(l1..ln) =
            [], n = 0
            reverseList(l2...ln) + reverseList(l1), l1 is list
            reverseList(l2...ln) + l1, otherwise
reverseList(list)
(reverseList '(1 2 3)) => (3 2 1)
(reverseList '(1 2 (3))) => ((3) 2 1)
(reverseList '(1 (2 3))) => ((3 2) 1)
(reverseList '(1 2 3 (4 5) (6 (7 8)))) => (((8 7) 6) (5 4) 3 2 1)
|#
(defun reverseList (l)
  (cond
    ((null l) nil)
    ((listp (car l)) (pushBack (reverseList (cdr l)) (list (reverseList (car l)))))
    (T (pushBack (reverseList (cdr l)) (list (car l))))
  )
)


; c) Write a function to return the list of the first elements of all list elements of a given list with an odd
; number of elements at superficial level. Example:
; (1 2 (3 (4 5) (6 7)) 8 (9 10 11)) => (1 3 9).
#|
listLength(l1..ln) =
          0, n = 0
          1 + listLength(l2..ln), otherwise
listLength(list)

(listLength '(1 3 4)) => 3
(listLength '(1 3 (4 5))) => 3
(listLength '()) => 0
|#
(defun listLength(l)
  (cond
    ((null l) 0)
    (T (+ 1 (listLength (cdr l))))
  )
)

#|
listOfFirstsForOddLength(l1..ln) =
           [], n = 0 or l not list
           l1[1] + listOfFirstsForOddLength(l2..ln), l1 is list and len(l1) is odd
           listOfFirstsForOddLength(l2..ln), otherwise
listOfFirstsForOddLength(list)

(listOfFirstsForOddLength '(1 3 (4 5))) => ()
(listOfFirstsForOddLength '(1 3 (4 5 1))) => (4)
(listOfFirstsForOddLength '(1 2 (3 (4 5) (6 7)) 8 (9 10 11))) => (3 9).
|#
(defun listOfFirstsForOddLength(l)
  (cond
    ((atom l) nil)
    ((and (listp (car l)) (= (mod (listLength (car l)) 2) 1)) (cons (car (car l)) (listOfFirstsForOddLength(cdr l))))
    (T (listOfFirstsForOddLength(cdr l)))
  )
)


; d) Write a function to return the sum of all numerical atoms in a list at superficial level
#|
sumOfElementsSuperficialLevel(l1...ln):
                         0, n = 0
                         l1 + sumOfElementsSuperficialLevel(l2..ln), l1 number
                         sumOfElementsSuperficialLevel(l2..ln), otherwise
sumOfElementsSuperficialLevel(list)
(sumOfElementsSuperficialLevel '(1 2 3)) => 6
(sumOfElementsSuperficialLevel '(1 2 (3))) => 3
(sumOfElementsSuperficialLevel '()) => 0
(sumOfElementsSuperficialLevel '(1 (2 3))) => 1
|#
(defun sumOfElementsSuperficialLevel(l)
  (cond
    ((null l) 0)
    ((numberp (car l)) (+ (car l) (sumOfElementsSuperficialLevel(cdr l))))
    (T (sumOfElementsSuperficialLevel(cdr l)))
  )
)

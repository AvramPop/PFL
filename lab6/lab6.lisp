;3. Return the number of levels of a tree of type (1).

#|
As an example, the tree
  A
 / \
B  C
  / \
 D   E
is represented as follows:
(A 2 B 0 C 2 D 0 E 0) (1)
|#

(defun levels(tree)
  (cond
    ((null tree) 0)
    ((= (car (cdr tree)) 0) 1)
    ((= (car (cdr tree)) 1) (+ 1 (levels (cdr (cdr tree)))))
    ((= (car (cdr tree)) 2) (+ 1 (max (levels (cdr (cdr tree))) (levels (sibling (cdr (cdr tree)))))))
  )
)
; (sibling '(B 2 D 2 H 0 I 0 E 1 J 1 K 0 C 2 F 0 G 1 L 1 M 1 N 0)) => (C 2 F 0 G 1 L 1 M 1 N 0) works
(defun sibling(tree)
  (cond
    ((null tree) nil)
    (t (siblingAux (cdr (cdr tree)) 1 (car (cdr tree))))
  )
)

(defun siblingAux(tree nodes edges)
  (cond
    ((null tree) nil)
    ((<= nodes edges) (siblingAux (cdr (cdr tree)) (+ 1 nodes) (+ edges (car (cdr tree)))))
    (t tree)
  )
)

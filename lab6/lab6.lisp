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

#|
levels (N1 S1 ... Nn Sn) =
         0, n = 0
         1, S1 = 0
         1 + levels(N2 S2 ... Nn Sn), S1 = 1
         1 + max(levels(N2 S2 ... Nn Sn), levels(sibling(N2 S2 ... Nn Sn)))
levels(tree as list in form 1)
|#
; tests:
; (levels '(A 2 B 2 D 2 H 0 I 0 E 1 J 1 K 0 C 2 F 0 G 1 L 1 M 1 N 0)) => 6
; (levels '(A 2 B 0 C 2 D 0 E 0)) => 3
; (levels '(A 2 B 2 D 0 E 1 F 2 G 0 H 0 C 1 I 1 J 1 K 0)) => 5

(defun levels(tree)
  (cond
    ((null tree) 0)
    ((= (car (cdr tree)) 0) 1)
    ((= (car (cdr tree)) 1) (+ 1 (levels (cdr (cdr tree)))))
    ((= (car (cdr tree)) 2) (+ 1 (max (levels (cdr (cdr tree))) (levels (sibling (cdr (cdr tree)))))))
  )
)

#|
sibling(N1 S1 ... Nn Sn) =
       nil, n = 0
       siblingAux(N2 S2 ... Nn Sn, 1, S1), otherwise
sibling(tree as list in form 1)
|#
; (sibling '(B 2 A 0 C 0 D 0)) => (D 0)
; (sibling '(A 2 B 1 C 0 D 1 E 0 F 1 G 2 H 0 I 1 J 1)) => (F 1 G 2 H 0 I 1 J 1)
; (sibling '(B 2 D 2 H 0 I 0 E 1 J 1 K 0 C 2 F 0 G 1 L 1 M 1 N 0)) => (C 2 F 0 G 1 L 1 M 1 N 0)
(defun sibling(tree)
  (cond
    ((null tree) nil)
    (t (siblingAux (cdr (cdr tree)) 1 (car (cdr tree))))
  )
)
#|
siblingAux(N1 S1 ... Nn Sn, nodes, edges) =
         nil, n = 0
         siblingAux (N2 S2 ... Nn Sn, nodes + 1, edges + S1), nodes <= edges
         N1 S1 ... Nn Sn, otherwise
siblingAux(tree as list in form 1, int, int)
|#
; (siblingAux '(A 0 C 0 D 0) 1 2) => (D 0)
; (siblingAux '(B 1 C 0 D 1 E 0 F 1 G 2 H 0 I 1 J 1) 1 2) => (F 1 G 2 H 0 I 1 J 1)
; (siblingAux '(D 2 H 0 I 0 E 1 J 1 K 0 C 2 F 0 G 1 L 1 M 1 N 0) 1 2) => (C 2 F 0 G 1 L 1 M 1 N 0) 
(defun siblingAux(tree nodes edges)
  (cond
    ((null tree) nil)
    ((<= nodes edges) (siblingAux (cdr (cdr tree)) (+ 1 nodes) (+ edges (car (cdr tree)))))
    (t tree)
  )
)

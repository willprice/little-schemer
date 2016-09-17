#lang racket/base

(require rackunit
         "../sets.rkt")

(test-case
  "set?"
  (check-equal? (set? '()) #t)
  (check-equal? (set? '(a a)) #f)
  (check-equal? (set? '(a b)) #t)
  (check-equal? (set? '(a (a))) #t)
  (check-equal? (set? '(a b a)) #f))

(test-case
  "makeset"
  (check-equal? (makeset '()) '())
  (check-equal? (makeset '(a)) '(a))
  (check-equal? (makeset '(a a)) '(a))
  (check-equal? (makeset '(a b c d a b d)) '(a b c d)))

(test-case
  "subset?"
  (check-equal? (subset? '() '()) #t)
  (check-equal? (subset? '(a) '()) #f)
  (check-equal? (subset? '() '(a)) #t)
  (check-equal? (subset? '(a) '(b)) #f)
  (check-equal? (subset? '(a) '(b a)) #t)
  (check-equal? (subset? '(a b) '(a c)) #f)
  (check-equal? (subset? '(a b c) '(a d b c)) #t))

(test-case
  "eqset?"
  (check-equal? (eqset? '() '()) #t)
  (check-equal? (eqset? '() '(a)) #f)
  (check-equal? (eqset? '(a) '()) #f)
  (check-equal? (eqset? '(a) '(a)) #t)
  (check-equal? (eqset? '(a b) '(a)) #f))

(test-case
  "intersect?"
  (check-equal? (intersect? '() '()) #f)
  (check-equal? (intersect? '(a) '(a)) #t)
  (check-equal? (intersect? '(b) '(a)) #f)
  (check-equal? (intersect? '(a b) '(b)) #t))

(test-case
 "intersect"
  (check-equal? (intersect '() '()) '())
  (check-equal? (intersect '(a) '(a)) '(a))
  (check-equal? (intersect '(a) '(b)) '())
  (check-equal? (intersect '(a) '(a b)) '(a))
  (check-equal? (intersect '(a b) '(a b c)) '(a b))
  (check-equal? (intersect '(a b c) '(a b)) '(a b)))

(test-case
  "union"
  (check-equal? (union '() '()) '())
  (check-equal? (union '(a) '()) '(a))
  (check-equal? (union '() '(a)) '(a))
  (check-equal? (union '(a) '(b)) '(a b))
  (check-equal? (union '(a b) '(a b)) '(a b))
  (check-equal? (union '(a b) '()) '(a b)))

(test-case
  "intersectall"
  (check-equal? (intersectall '(())) '())
  (check-equal? (intersectall '((a))) '(a))
  (check-equal? (intersectall '((a) (b))) '())
  (check-equal? (intersectall '((a b) (b))) '(b))
  (check-equal? (intersectall '((a b c) (b a) (b a c))) '(a b)))

#lang racket/base

(require rackunit
         "../rels.rkt")

(test-case
  "fun?"
  (check-equal? (fun? '()) #t)
  (check-equal? (fun? '((3 5) (4 3))) #t)
  (check-equal? (fun? '((4 5) (4 3))) #f))

(test-case
  "revrel"
  (check-equal? (revrel '()) '())
  (check-equal? (revrel '((a b))) '((b a)))
  (check-equal? (revrel '((a b) (c d))) '((b a) (d c))))

(test-case
  "fullfun?"
  (check-equal? (fullfun? '()) #t)
  (check-equal? (fullfun? '((4 4))) #t)
  (check-equal? (fullfun? '((4 5))) #t)
  (check-equal? (fullfun? '((4 5))) #t)
  (check-equal? (fullfun? '((4 5) (4 3))) #f)
  (check-equal? (fullfun? '((4 5) (2 3))) #t))


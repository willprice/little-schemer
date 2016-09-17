#lang racket/base

(require rackunit
         "../misc.rkt")

(test-case
  "sero?"
  (check-equal? (sero? '()) #t)
  (check-equal? (sero? '(())) #f))

(test-case
  "edd1"
  (check-equal? (edd1 '()) '(()))
  (check-equal? (edd1 '(())) '(() ())))

(test-case
  "zub1"
  (check-equal? (zub1 '(())) '())
  (check-equal? (zub1 '(() ())) '(())))

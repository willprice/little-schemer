#lang racket/base

(require rackunit
         "../tups.rkt")

(test-case
  "tup?"
  (check-equal? (tup? '()) #t)
  (check-equal? (tup? '(a)) #f)
  (check-equal? (tup? '(1)) #t)
  (check-equal? (tup? '(1 a)) #f)
  (check-equal? (tup? '(1 2)) #t))

(test-case
  "addtup"
  (check-equal? (addtup '()) 0 "Sum an empty tup")
  (check-equal? (addtup '(1)) 1 "Sum a tup of length 1 containing 1")
  (check-equal? (addtup '(1 1)) 2 "Sum a tup of length 2 containing 1s")
  (check-equal? (addtup '(1 2 3 1)) 7 "Sum a big tup"))

(test-case
  "tup+"
  (check-equal? (tup+ '() '()) '())
  (check-equal? (tup+ '(1) '()) '(1))
  (check-equal? (tup+ '() '(1)) '(1))
  (check-equal? (tup+ '(1) '(1)) '(2))
  (check-equal? (tup+ '(1 2) '(1 1)) '(2 3)))

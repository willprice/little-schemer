#lang racket/base

(require rackunit
         "../add-tup.rkt")

(check-equal? (add-tup '()) 0 "Sum an empty tup")
(check-equal? (add-tup '(1)) 1 "Sum a tup of length 1 containing 1")
(check-equal? (add-tup '(1 1)) 2 "Sum a tup of length 2 containing 1s")
(check-equal? (add-tup '(1 2 3 1)) 7 "Sum a big tup")

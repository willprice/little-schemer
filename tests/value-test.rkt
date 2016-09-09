#lang racket/base

(require rackunit
         "../value.rkt")

(check-equal? (value 1) 1)
(check-equal? (value 2) 2)
(check-equal? (value '(1 + 1)) 2)
(check-equal? (value '(1 + (1 + 1))) 3)
(check-equal? (value '(1 x 1)) 1)
(check-equal? (value '(2 ^ 3)) 8)
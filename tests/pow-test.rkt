#lang racket/base

(require rackunit
         "../pow.rkt")

(check-equal? (pow 1 1) 1)
(check-equal? (pow 2 1) 2)
(check-equal? (pow 2 2) 4)
(check-equal? (pow 2 3) 8)
(check-equal? (pow 3 2) 9)

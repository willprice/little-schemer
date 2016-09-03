#lang racket/base

(require rackunit
         "../length.rkt")

(check-equal? (length '()) 0)
(check-equal? (length '(a)) 1)
(check-equal? (length '(a b)) 2)
(check-equal? (length '(a b c d)) 4)

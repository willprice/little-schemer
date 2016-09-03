#lang racket/base

(require rackunit
         "../pick.rkt")

(check-equal? (pick 1 '(a)) 'a)
(check-equal? (pick 2 '(a b)) 'b)
(check-equal? (pick 5 '(a b c d e f)) 'e)

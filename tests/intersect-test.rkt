#lang racket/base

(require rackunit
         "../intersect.rkt")

(check-equal? (intersect '() '()) '())
(check-equal? (intersect '(a) '(a)) '(a))
(check-equal? (intersect '(a) '(b)) '())
(check-equal? (intersect '(a) '(a b)) '(a))
(check-equal? (intersect '(a b) '(a b c)) '(a b))
(check-equal? (intersect '(a b c) '(a b)) '(a b))
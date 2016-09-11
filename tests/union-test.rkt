#lang racket/base

(require rackunit
         "../union.rkt")

(check-equal? (union '() '()) '())
(check-equal? (union '(a) '()) '(a))
(check-equal? (union '() '(a)) '(a))
(check-equal? (union '(a) '(b)) '(a b))
(check-equal? (union '(a b) '(a b)) '(a b))
(check-equal? (union '(a b) '()) '(a b))

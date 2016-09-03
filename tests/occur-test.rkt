#lang racket/base

(require rackunit
         "../occur.rkt")

(check-equal? (occur 'a '()) 0)
(check-equal? (occur 'a '(a)) 1)
(check-equal? (occur 'a '(b a)) 1)
(check-equal? (occur 'a '(a a)) 2)
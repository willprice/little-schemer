#lang racket/base

(require rackunit
         "../set-p.rkt")

(check-equal? (set? '()) #t)
(check-equal? (set? '(a a)) #f)
(check-equal? (set? '(a b)) #t)
(check-equal? (set? '(a (a))) #t)
(check-equal? (set? '(a b a)) #f)
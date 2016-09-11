#lang racket/base

(require rackunit
         "../subset.rkt")

(check-equal? (subset? '() '()) #t)
(check-equal? (subset? '(a) '()) #f)
(check-equal? (subset? '() '(a)) #t)
(check-equal? (subset? '(a) '(b)) #f)
(check-equal? (subset? '(a) '(b a)) #t)
(check-equal? (subset? '(a b) '(a c)) #f)
(check-equal? (subset? '(a b c) '(a d b c)) #t)

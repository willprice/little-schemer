#lang racket/base

(require rackunit
         "../intersect-p.rkt")

(check-equal? (intersect? '() '()) #f)
(check-equal? (intersect? '(a) '(a)) #t)
(check-equal? (intersect? '(b) '(a)) #f)
(check-equal? (intersect? '(a b) '(b)) #t)

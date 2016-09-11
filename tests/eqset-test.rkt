#lang racket/base

(require rackunit
         "../eqset.rkt")

(check-equal? (eqset? '() '()) #t)
(check-equal? (eqset? '() '(a)) #f)
(check-equal? (eqset? '(a) '()) #f)
(check-equal? (eqset? '(a) '(a)) #t)
(check-equal? (eqset? '(a b) '(a)) #f)
#lang racket/base

(require rackunit
         "../eqan.rkt")

(check-equal? (eqan? 'a 'a) #t)
(check-equal? (eqan? 'a 'b) #f)
(check-equal? (eqan? 1 1) #t)
(check-equal? (eqan? 1 2) #f)
(check-equal? (eqan? 1 'a) #f)
(check-equal? (eqan? '() 'a) #f)
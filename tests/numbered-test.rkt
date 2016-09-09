#lang racket/base

(require rackunit
         "../numbered.rkt")

(check-equal? (numbered? 1) #t)
(check-equal? (numbered? 'a) #f)
(check-equal? (numbered? '(1 + 1)) #t)
(check-equal? (numbered? '(1 x (1 + 2))) #t)
(check-equal? (numbered? '(1 x (1 + 'a))) #f)
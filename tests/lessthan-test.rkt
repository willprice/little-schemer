#lang racket/base

(require rackunit
         "../lessthan.rkt")

(check-equal? (lessthan 0 0) #f)
(check-equal? (lessthan 0 1) #t)
(check-equal? (lessthan 1 0) #f)
(check-equal? (lessthan 1 1) #f)
(check-equal? (lessthan 5 6) #t)

#lang racket/base

(require rackunit
         "../my-equal.rkt")

(check-equal? (my-equal? '() '()) #t)
(check-equal? (my-equal? '() 'a) #f)
(check-equal? (my-equal? 'a 'a) #t)
(check-equal? (my-equal? 1 1) #t)
(check-equal? (my-equal? '(a) '(a)) #t)
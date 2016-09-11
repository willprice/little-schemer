#lang racket/base

(require rackunit
         "../a-pair-p.rkt")

(check-equal? (a-pair? '()) #f)
(check-equal? (a-pair? '(a b)) #t)
(check-equal? (a-pair? 'a) #f)

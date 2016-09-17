#lang racket/base

(require rackunit
         "../expressions.rkt")

(test-case
  "value"
  (check-equal? (value 1) 1)
  (check-equal? (value 2) 2)
  (check-equal? (value '(1 + 1)) 2)
  (check-equal? (value '(1 + (1 + 1))) 3)
  (check-equal? (value '(1 x 1)) 1)
  (check-equal? (value '(2 ^ 3)) 8))

(test-case
  "numbered?"
  (check-equal? (numbered? 1) #t)
  (check-equal? (numbered? 'a) #f)
  (check-equal? (numbered? '(1 + 1)) #t)
  (check-equal? (numbered? '(1 x (1 + 2))) #t)
  (check-equal? (numbered? '(1 x (1 + 'a))) #f))

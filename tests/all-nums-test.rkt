#lang racket/base

(require rackunit
         "../all-nums.rkt")

(check-equal? (all-nums '()) '())
(check-equal? (all-nums '(1)) '(1))
(check-equal? (all-nums  '(a 1)) '(1))
(check-equal? (all-nums '(a a 1)) '(1))
(check-equal? (all-nums '(1 a)) '(1))
(check-equal? (all-nums '(1 1)) '(1 1))
#lang racket/base

(require rackunit
         "../no-nums.rkt")

(check-equal? (no-nums '()) '())
(check-equal? (no-nums '(a)) '(a))
(check-equal? (no-nums '(1)) '())
(check-equal? (no-nums '(1 a)) '(a))
(check-equal? (no-nums '(1 a 1)) '(a))
#lang racket/base

(require rackunit
         "../leftmost.rkt")

(check-equal? (leftmost '(1)) 1)
(check-equal? (leftmost '((1))) 1)
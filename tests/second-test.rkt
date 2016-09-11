#lang racket/base

(require rackunit
         "../second.rkt")

(check-equal? (second '(a b)) 'b)

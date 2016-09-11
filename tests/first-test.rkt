#lang racket/base

(require rackunit
         "../first.rkt")

(check-equal? (first '(a b)) 'a)

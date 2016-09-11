#lang racket/base

(require rackunit
         "../firsts.rkt")

(check-equal? (firsts '()) '())
(check-equal? (firsts '((a))) '(a))
(check-equal? (firsts '((a) (b))) '(a b))
(check-equal? (firsts '((a b) (b c))) '(a b))
#lang racket/base

(require rackunit
         "../revrel.rkt")

(check-equal? (revrel '()) '())
(check-equal? (revrel '((a b))) '((b a)))
(check-equal? (revrel '((a b) (c d))) '((b a) (d c)))
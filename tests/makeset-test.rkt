#lang racket/base

(require rackunit
         "../makeset.rkt")

(check-equal? (makeset '()) '())
(check-equal? (makeset '(a)) '(a))
(check-equal? (makeset '(a a)) '(a))
(check-equal? (makeset '(a b c d a b d)) '(a b c d))
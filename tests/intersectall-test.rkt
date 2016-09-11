#lang racket/base

(require rackunit
         "../intersectall.rkt")

(check-equal? (intersectall '(())) '())
(check-equal? (intersectall '((a))) '(a))
(check-equal? (intersectall '((a) (b))) '())
(check-equal? (intersectall '((a b) (b))) '(b))
(check-equal? (intersectall '((a b c) (b a) (b a c))) '(a b))
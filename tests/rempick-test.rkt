#lang racket/base

(require rackunit
         "../rempick.rkt")

(check-equal? (rempick 1 '(a)) '())
(check-equal? (rempick 1 '(a b)) '(b))
(check-equal? (rempick 2 '(a b)) '(a))
(check-equal? (rempick 3 '(hotdogs with hot mustard)) '(hotdogs with mustard))

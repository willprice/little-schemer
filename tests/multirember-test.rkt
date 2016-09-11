#lang racket/base

(require rackunit
         "../multirember.rkt")

(check-equal? (multirember 'a '()) '())
(check-equal? (multirember 'a '(b)) '(b))
(check-equal? (multirember 'a '(a)) '())
(check-equal? (multirember 'a '(b a)) '(b))
(check-equal? (multirember '(a) '(a b c (a))) '(a b c))
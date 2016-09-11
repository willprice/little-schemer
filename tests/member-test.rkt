#lang racket/base

(require rackunit
         "../member.rkt")

(check-equal? (member? 'a '()) #f)
(check-equal? (member? 'a '(a)) #t)
(check-equal? (member? 'a '(b)) #f)
(check-equal? (member? 'a '(b a)) #t)
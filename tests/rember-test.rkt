#lang racket/base

(require rackunit
         "../rember.rkt")

(check-equal? (rember 'a '()) '())
(check-equal? (rember 'a '(b)) '(b))
(check-equal? (rember 'a '(a)) '())
(check-equal? (rember 'a '(b a)) '(b))
(check-equal? (rember '(a) '((a))) '())
(check-equal? (rember 'a '((a b) a b)) '((a b) b))
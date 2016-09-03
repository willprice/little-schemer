#lang racket/base

(require rackunit
         "../tup-add.rkt")

(check-equal? (tup+ '() '()) '())
(check-equal? (tup+ '(1) '()) '(1))
(check-equal? (tup+ '() '(1)) '(1))
(check-equal? (tup+ '(1) '(1)) '(2))
(check-equal? (tup+ '(1 2) '(1 1)) '(2 3))

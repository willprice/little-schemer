#lang racket/base

(require rackunit
         "../fullfun-p.rkt")

(check-equal? (fullfun? '()) #t)
(check-equal? (fullfun? '((a b))) #t)
(check-equal? (fullfun? '((a b) (c b))) #f)
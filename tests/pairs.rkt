#lang racket/base

(require rackunit
         "../pairs.rkt")

(test-case
  "a-pair?"
  (check-equal? (a-pair? '()) #f)
  (check-equal? (a-pair? '(a b)) #t)
  (check-equal? (a-pair? 'a) #f))

(test-case
  "first"
  (check-equal? (first '(a b)) 'a))

(test-case
 "second"
 (check-equal? (second '(a b)) 'b))

(test-case
  "build"
  (check-equal? (build 'a 'b) '(a b)))

(test-case
  "revpair"
  (check-equal? (revpair '(a b)) '(b a)))

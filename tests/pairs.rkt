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

(test-case
  "shift"
  (check-equal? (shift '((a b) c)) '(a (b c)))
  (check-equal? (shift '((a b) (c d))) '(a (b (c d)))))

(test-case
  "weight*"
  (check-equal? (weight* 'a) 1)
  (check-equal? (weight* '(a a)) 2)
  (check-equal? (weight* '((a a) a)) 3)
  (check-equal? (weight* '(a (a a))) 3)
  (check-equal? (weight* '((a a) (a a))) 4))

(test-case
  "length*"
  (check-equal? (length* '(a a)) 2)
  (check-equal? (length* '((a a) a)) 3)
  (check-equal? (length* '(a (a a))) 3)
  (check-equal? (length* '((a a) (a a))) 4)
  (check-equal? (length* '((a (a a)) (a a))) 5))

(test-case
  "shuffle"
  (check-equal? (shuffle 'a) 'a)
  (check-equal? (shuffle '(a b)) '(a b))
  (check-equal? (shuffle '(a (b c))) '(a (b c)))
  (check-equal? (shuffle '((a b) c)) '(c (a b))))



#lang racket/base

(require rackunit
         "../equality.rkt")

(test-case
  "eqan?"
  (check-equal? (eqan? 'a 'a) #t)
  (check-equal? (eqan? 'a 'b) #f)
  (check-equal? (eqan? 1 1) #t)
  (check-equal? (eqan? 1 2) #f)
  (check-equal? (eqan? 1 'a) #f)
  (check-equal? (eqan? 'a 1) #f))

(test-case
  "eqlist?"
  (check-equal? (eqlist? '() '()) #t)
  (check-equal? (eqlist? '(a) '()) #f)
  (check-equal? (eqlist? '() '(a)) #f)
  (check-equal? (eqlist? '(a) '(a)) #t)
  (check-equal? (eqlist? '(b) '(a)) #f)
  (check-equal? (eqlist? '(a b) '(a)) #f)
  (check-equal? (eqlist? '(a b) '(a b)) #t)
  (check-equal? (eqlist? '(a b) '(a a)) #f))

(test-case
  "equal?"
  (check-equal? (my-equal? '() '()) #t)
  (check-equal? (my-equal? '() 'a) #f)
  (check-equal? (my-equal? 'a 'a) #t)
  (check-equal? (my-equal? 1 1) #t)
  (check-equal? (my-equal? '(a) '(a)) #t))

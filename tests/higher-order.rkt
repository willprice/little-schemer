#lang racket/base

(require rackunit
         "../higher-order.rkt")

(test-case
  "eq-c?"
  (check-equal? ((eq-c 'a) 'a) #t)
  (check-equal? ((eq-c 'a) 'b) #f)
  (check-equal? ((eq-c 'b) 'b) #t))

(test-case
  "rember-f"
  (check-equal? ((rember-f eq?) 'a '()) '())
  (check-equal? ((rember-f eq?) 'a '(a)) '())
  (check-equal? ((rember-f eq?) 'a '(b a)) '(b))
  (check-equal? ((rember-f equal?) '() '(a b () c)) '(a b c)))

(test-case
  "insertL-f"
  (check-equal? ((insertL-f eq?) 'new 'old '()) '())
  (check-equal? ((insertL-f eq?) 'new 'old '(old)) '(new old))
  (check-equal? ((insertL-f eq?) 'new 'old '(old old)) '(new old old))
  (check-equal? ((insertL-f eq?) 'new 'old '(a)) '(a))
  (check-equal? ((insertL-f eq?) 'new 'old '(a old)) '(a new old)))

(test-case
  "insertR-f"
  (check-equal? ((insertR-f eq?) 'new 'old '()) '())
  (check-equal? ((insertR-f eq?) 'new 'old '(old)) '(old new))
  (check-equal? ((insertR-f eq?) 'new 'old '(old old)) '(old new old))
  (check-equal? ((insertR-f eq?) 'new 'old '(a)) '(a))
  (check-equal? ((insertR-f eq?) 'new 'old '(a old)) '(a old new)))

(define prependL
  (lambda (new old l)
    (cons new (cons old l))))

(define prependR
  (lambda (new old l)
    (cons old (cons new l))))

(test-case
  "insert-g"
  (check-equal? ((insert-g equal? prependL) 'new 'old '()) '())
  (check-equal? ((insert-g equal? prependL) 'new 'old '(old)) '(new old))
  (check-equal? ((insert-g equal? prependL) 'new 'old '(a old)) '(a new old))
  (check-equal? ((insert-g equal? prependL) 'new 'old '(a old old)) '(a new old old))
  (check-equal? ((insert-g equal? prependR) 'new 'old '(a old old)) '(a old new old)))


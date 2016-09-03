#lang racket/base

(require rackunit
         "../greaterthan.rkt")

(check-equal? (greaterthan 0 0) #f)
(check-equal? (greaterthan 1 0) #t)
(check-equal? (greaterthan 0 1) #f)
(check-equal? (greaterthan 1 1) #f)
(check-equal? (greaterthan 5 3) #t)

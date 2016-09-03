#lang racket/base

(require rackunit
         "../one.rkt")

(check-equal? (one? 0) #f)
(check-equal? (one? 1) #t)
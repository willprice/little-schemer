#lang racket/base

(require rackunit
         "../my-subtract.rkt")

(check-equal? (my-subtract 0 0) 0 "0 - 0")
(check-equal? (my-subtract 1 0) 1 "1 - 0")
(check-equal? (my-subtract 2 1) 1 "2 - 1")
(check-equal? (my-subtract 5 3) 2 "5 - 3")

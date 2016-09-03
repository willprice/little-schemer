#lang racket/base

(require rackunit
         "../multiply.rkt")

(check-equal? (multiply 1 1) 1 "1 * 1")
(check-equal? (multiply 2 1) 2 "2 * 1")
(check-equal? (multiply 1 2) 2 "1 * 2")
(check-equal? (multiply 5 3) 15 "5 * 3")

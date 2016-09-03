#lang racket/base

(require rackunit
         "../my-add.rkt")


(check-equal? (my-add 0 0) 0 "0 + 0")
(check-equal? (my-add 0 1) 1 "0 + 1")
(check-equal? (my-add 1 0) 1 "1 + 0")
(check-equal? (my-add 10 15) 25 "10 + 15")

(check-equal? (my-add-naturally-recursive 0 0) 0 "0 + 0")
(check-equal? (my-add-naturally-recursive 0 1) 1 "0 + 1")
(check-equal? (my-add-naturally-recursive 1 0) 1 "1 + 0")
(check-equal? (my-add-naturally-recursive 10 15) 25 "10 + 15")

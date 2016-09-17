#lang racket/base

(require rackunit
         "../numbers.rkt")

(test-case
  "+"
  (check-equal? (my-+ 0 0) 0 "0 + 0")
  (check-equal? (my-+ 0 1) 1 "0 + 1")
  (check-equal? (my-+ 1 0) 1 "1 + 0")
  (check-equal? (my-+ 10 15) 25 "10 + 15")

  (check-equal? (my-+-naturally-recursive 0 0) 0 "0 + 0")
  (check-equal? (my-+-naturally-recursive 0 1) 1 "0 + 1")
  (check-equal? (my-+-naturally-recursive 1 0) 1 "1 + 0")
  (check-equal? (my-+-naturally-recursive 10 15) 25 "10 + 15"))

(test-case
  "-"
  (check-equal? (my-- 0 0) 0 "0 - 0")
  (check-equal? (my-- 1 0) 1 "1 - 0")
  (check-equal? (my-- 2 1) 1 "2 - 1")
  (check-equal? (my-- 5 3) 2 "5 - 3"))

(test-case
  "x"
  (check-equal? (my-x 1 1) 1 "1 * 1")
  (check-equal? (my-x 2 1) 2 "2 * 1")
  (check-equal? (my-x 1 2) 2 "1 * 2")
  (check-equal? (my-x 5 3) 15 "5 * 3"))

(test-case
  ">"
  (check-equal? (my-> 0 0) #f)
  (check-equal? (my-> 1 0) #t)
  (check-equal? (my-> 0 1) #f)
  (check-equal? (my-> 1 1) #f)
  (check-equal? (my-> 5 3) #t))

(test-case
  "<"
  (check-equal? (my-< 0 0) #f)
  (check-equal? (my-< 0 1) #t)
  (check-equal? (my-< 1 0) #f)
  (check-equal? (my-< 1 1) #f)
  (check-equal? (my-< 5 6) #t))

(test-case
  "^"
  (check-equal? (my-^ 1 1) 1)
  (check-equal? (my-^ 2 1) 2)
  (check-equal? (my-^ 2 2) 4)
  (check-equal? (my-^ 2 3) 8)
  (check-equal? (my-^ 3 2) 9))

(test-case
  "="
  (check-equal? (my-= 0 0) #t)
  (check-equal? (my-= 1 0) #f)
  (check-equal? (my-= 1 1) #t)
  (check-equal? (my-= 0 1) #f)
  (check-equal? (my-= 2 2) #t))

(test-case
  "/"
  (check-equal? (my-/ 1 1) 1)
  (check-equal? (my-/ 2 1) 2)
  (check-equal? (my-/ 6 2) 3)
  (check-equal? (my-/ 6 3) 2)
  (check-equal? (my-/ 18 6) 3))

(test-case
  "one?"
  (check-equal? (one? 0) #f)
  (check-equal? (one? 1) #t))

(test-case
  "even?"
  (check-equal? (even? 0) #t)
  (check-equal? (even? 1) #f)
  (check-equal? (even? 2) #t)
  (check-equal? (even? 3) #f)
  (check-equal? (even? 4) #t))

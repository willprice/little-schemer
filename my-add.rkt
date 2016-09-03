#lang racket/base

(define my-add
  (lambda (n1 n2)
    (cond
      ((zero? n1) n2)
      (else (my-add (sub1 n1) (add1 n2))))))
;; Apparently this is considered bad practice in the little schemer due
;; to not being a 'natural recursion'
;; see: http://stackoverflow.com/questions/32260444/what-is-the-definition-of-natural-recursion
;; and: http://i.stack.imgur.com/QhBcl.png 

;; Here's an alternative that is naturally recursive
(define my-add-naturally-recursive
  (lambda (n1 n2)
    (cond
      ((zero? n1) n2)
      ;; Rather than using tail recursion we instead modify a single argument
      ;; to get closer to the termination condition (see the third commandment)
      ;;
      ;; Performing the addition inside the arguments doesn't bring the argument
      ;; list closer to termination (although it doesn't take it further from
      ;; termination...)
      (else (add1 (my-add-naturally-recursive (sub1 n1) n2))))))

(provide my-add my-add-naturally-recursive)

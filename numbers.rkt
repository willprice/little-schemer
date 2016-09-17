#lang racket/base

(provide
  my-+
  my-+-naturally-recursive
  my--
  my-x
  my->
  my-<
  my-^
  my-=
  my-/
  one?)


(define my-+
  (lambda (n1 n2)
    (cond
      ((zero? n1) n2)
      (else (my-+ (sub1 n1) (add1 n2))))))
;; Apparently this is considered bad practice in the little schemer due
;; to not being a 'natural recursion'
;; see: http://stackoverflow.com/questions/32260444/what-is-the-definition-of-natural-recursion
;; and: http://i.stack.imgur.com/QhBcl.png 

;; Here's an alternative that is naturally recursive
(define my-+-naturally-recursive
  (lambda (n1 n2)
    (cond
      ((zero? n1) n2)
      ;; Rather than using tail recursion we instead modify a single argument
      ;; to get closer to the termination condition (see the third commandment)
      ;;
      ;; Performing the addition inside the arguments doesn't bring the argument
      ;; list closer to termination (although it doesn't take it further from
      ;; termination...)
      (else (add1 (my-+-naturally-recursive (sub1 n1) n2))))))

(define my--
  ;; n1 - n2
  (lambda (n1 n2)
    (cond
      ((zero? n2) n1)
      (else (sub1 (my-- n1 (sub1 n2)))))))

(define my-x
  (lambda (n1 n2)
    (cond
      ((zero? n2) 0)
      (else (+ n1 (my-x n1 (sub1 n2)))))))


(define my->
  ;; n1 > n2
  (lambda (n1 n2)
    (cond
      ((zero? n1) #f)
      ((zero? n2) #t)
      (else (my-> (sub1 n1) (sub1 n2))))))

(define my-<
  ;; n1 < n2
  (lambda (n1 n2)
    (cond
      ((and (zero? n1) (zero? n2)) #f)
      ((zero? n1) #t)
      ((zero? n2) #f)
      (else (my-< (sub1 n1) (sub1 n2))))))

(define my-=
  (lambda (n m)
    (cond
      ((zero? n) (zero? m))
      (else (my-= (sub1 n) (sub1 m))))))

(define my-^
  (lambda (base exponent)
    (cond
      ((zero? exponent) 1)
      (else
       (* base (my-^ base (sub1 exponent)))))))

(define my-/
  (lambda (n m)
    (cond
      ((< n m) 0)
      (else (add1 (my-/ (- n m) m))))))

(define one?
  (lambda (n)
    (eq? n 1)))

#lang racket/base

(define lessthan
  ;; n1 < n2
  (lambda (n1 n2)
    (cond
      ((and (zero? n1) (zero? n2)) #f)
      ((zero? n1) #t)
      ((zero? n2) #f)
      (else (lessthan (sub1 n1) (sub1 n2))))))

(provide lessthan)

#lang racket/base

(define greaterthan
  ;; n1 > n2
  (lambda (n1 n2)
    (cond
      ((zero? n1) #f)
      ((zero? n2) #t)
      (else (greaterthan (sub1 n1) (sub1 n2))))))

(provide greaterthan)

#lang racket/base

(define my-subtract
  ;; n1 - n2
  (lambda (n1 n2)
    (cond
      ((zero? n2) n1)
      (else (sub1 (my-subtract n1 (sub1 n2)))))))

(provide my-subtract)

#lang racket/base

(define multiply
  (lambda (n1 n2)
    (cond
      ((zero? n2) 0)
      (else (+ n1 (multiply n1 (sub1 n2)))))))

(provide multiply)

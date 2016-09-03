#lang racket/base

(define pow
  (lambda (base exponent)
    (cond
      ((zero? exponent) 1)
      (else
       (* base (pow base (sub1 exponent)))))))

(provide pow)

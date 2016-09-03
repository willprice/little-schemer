#lang racket/base

(define add-tup
  (lambda (tup)
    (cond
      ((null? tup) 0)
      (else (+ (car tup) (add-tup (cdr tup)))))))

(provide add-tup)

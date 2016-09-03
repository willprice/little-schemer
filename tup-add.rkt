#lang racket/base


(define tup+
  (lambda (tup1 tup2)
    (cond
      ((null? tup2) tup1)
      ((null? tup1) tup2)
      (else (cons (+ (car tup1) (car tup2)) (tup+ (cdr tup1) (cdr tup2)))))))

(provide tup+)

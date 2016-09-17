#lang racket/base
(require "primitives.rkt")
(require "equality.rkt")

(define my-equal?
  (lambda (s1 s2)
    (cond
      ((and (atom? s1) (atom? s2)) (eqan? s1 s2))
      ((or (atom? s1) (atom? s2)) #f)
      (else (eqlist? s1 s2)))))

(provide my-equal?)

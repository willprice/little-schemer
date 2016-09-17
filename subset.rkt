#lang racket/base
(require "lats.rkt")

(define subset?
  (lambda (s1 s2)
    (cond
      ((null? s1) #t)
      ((member? (car s1) s2) (subset? (cdr s1) s2))
      (else #f))))

(provide subset?)

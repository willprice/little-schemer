#lang racket/base
(require "lats.rkt")

(define intersect?
  (lambda (s1 s2)
    (cond
      ((null? s1) #f)
      ((member? (car s1) s2) #t)
      (else (intersect? (cdr s1) s2)))))

(provide intersect?)

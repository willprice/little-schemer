#lang racket/base
(require "member.rkt")

(define union
  (lambda (s1 s2)
    (cond
      ((null? s1) s2)
      ((member? (car s1) s2)
       (union (cdr s1) s2))
      (else
       (cons (car s1)
             (union (cdr s1) s2))))))

(provide union)

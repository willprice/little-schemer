#lang racket/base
(require "member.rkt")

(define intersect
  (lambda (s1 s2)
    (cond
      ((null? s1) '())
      ((member? (car s1) s2)
       (cons (car s1) (intersect (cdr s1) s2)))
      (else (intersect (cdr s1) s2)))))
(provide intersect)

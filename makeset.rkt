#lang racket/base
(require "lats.rkt")

(define makeset
  (lambda (l)
    (cond
      ((null? l) '())
      (else 
       (cons (car l) (makeset (multirember (car l) (cdr l))))))))

(provide makeset)

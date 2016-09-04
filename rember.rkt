#lang racket/base
(require "atom.rkt")

(define rember
  (lambda (s l)
    (cond
      ((null? l) '())
      ((equal? s (car l)) (cdr l))
      (else
       (cons (car l) (rember s (cdr l)))))))

(provide rember)

#lang racket/base

(define multirember
  (lambda (sexp l)
    (cond
      ((null? l) '())
      ((equal? sexp (car l)) (multirember sexp (cdr l)))
      (else (cons (car l) (multirember sexp (cdr l)))))))

(provide multirember)

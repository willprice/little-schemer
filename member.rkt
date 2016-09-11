#lang racket/base

(define member?
  (lambda (sexp l)
    (cond
      ((null? l) #f)
      (else (or (eq? (car l) sexp)
                 (member? sexp (cdr l)))))))

(provide member?)

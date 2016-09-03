#lang racket/base

(define atom?
  (lambda (x)
    (and (not (null? x))
         (not (pair? x)))))

(provide atom?)

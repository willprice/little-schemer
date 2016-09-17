#lang racket/base
(provide atom?)

(define atom?
  (lambda (x)
    (and (not (null? x))
         (not (pair? x)))))


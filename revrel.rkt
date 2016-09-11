#lang racket/base
(require "first.rkt"
         "second.rkt"
         "build.rkt")

(define revrel
  (lambda (rel)
    (cond
      ((null? rel) '())
      (else
       (cons
        (build (second (car rel))
               (first (car rel)))
        (revrel (cdr rel)))))))

(provide revrel)

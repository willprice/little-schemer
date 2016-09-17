#lang racket/base

(require "sets.rkt"
         "pairs.rkt"
         "lists.rkt")
(provide
  fun?
  revrel
  fullfun?)

(define fun?
  (lambda (rel)
    (set? (firsts rel))))

(define revrel
  (lambda (rel)
    (cond
      ((null? rel) '())
      (else
       (cons
        (build (second (car rel))
               (first (car rel)))
        (revrel (cdr rel)))))))

; aka one-to-one?
(define fullfun?
  (lambda (rel)
    (and
      (fun? rel)
      (fun? (revrel rel)))))

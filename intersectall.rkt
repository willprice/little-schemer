#lang racket/base
(require "intersect.rkt")

(define intersectall
  (lambda (l-set)
    (cond
      ((null? (cdr l-set)) (car l-set))
      (else
       (intersect
        (car l-set)
        (intersectall (cdr l-set)))))))
(provide intersectall)

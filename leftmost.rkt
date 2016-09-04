#lang racket/base

(require "atom.rkt")

(define leftmost
  (lambda (l)
    (cond
      ((atom? (car l)) (car l))
      (else (leftmost (car l))))))

(provide leftmost)

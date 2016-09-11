#lang racket/base

(define second
  (lambda (pair)
    (car (cdr pair))))

(provide second)

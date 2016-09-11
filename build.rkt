#lang racket/base

(define build
  (lambda (s1 s2)
    (cons s1
          (cons s2 '()))))

(provide build)

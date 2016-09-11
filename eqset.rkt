#lang racket/base
(require "subset.rkt")

(define eqset?
  (lambda (s1 s2)
    (and
      (subset? s1 s2)
      (subset? s2 s1))))

(provide eqset?)

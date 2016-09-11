#lang racket/base

(require "set-p.rkt"
         "firsts.rkt")

(define fun?
  (lambda (rel)
    (set? (firsts rel))))

(provide fun?)

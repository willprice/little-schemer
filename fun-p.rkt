#lang racket/base

(require "set-p.rkt"
         "lists.rkt")

(define fun?
  (lambda (rel)
    (set? (firsts rel))))

(provide fun?)

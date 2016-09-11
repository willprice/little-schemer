#lang racket/base

(require "fun-p.rkt"
         "revrel.rkt")

(define fullfun?
  (lambda (rel)
    (fun? (revrel rel))))

(provide fullfun?)

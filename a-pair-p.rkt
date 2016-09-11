#lang racket/base
(require "atom.rkt")

(define a-pair?
  (lambda (l)
    (cond
      ((null? l) #f)
      ((atom? l) #f)
      ((null? (cdr l)) #f)
      ((null? (cdr (cdr l))) #t))))

(provide a-pair?)

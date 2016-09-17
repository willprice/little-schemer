#lang racket/base

(require "atom.rkt")
(provide
  a-pair?
  first
  second
  build
  revpair)

(define a-pair?
  (lambda (l)
    (cond
      ((null? l) #f)
      ((atom? l) #f)
      ((null? (cdr l)) #f)
      ((null? (cdr (cdr l))) #t))))

(define first
  (lambda (pair)
    (car pair)))

(define second
  (lambda (pair)
    (car (cdr pair))))

(define build
  (lambda (s1 s2)
    (cons s1
          (cons s2 '()))))

(define revpair
  (lambda (pair)
    (build (second pair) (first pair))))

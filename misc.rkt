#lang racket/base

(provide
  sero?
  edd1
  zub1)

; These functions all operate on numbers represented as consed empty lists

(define sero?
  (lambda (l)
    (null? l)))

(define edd1
  (lambda (l)
    (cons '() l)))

(define zub1
  (lambda (l)
    (cdr l)))

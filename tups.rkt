#lang racket/base

(provide
  tup?
  addtup
  tup+)

(define tup?
  (lambda (l)
    (cond
      ((null? l) #t)
      ((number? (car l)) (tup? (cdr l)))
      (else #f))))

(define addtup
  (lambda (tup)
    (cond
      ((null? tup) 0)
      (else (+ (car tup) (addtup (cdr tup)))))))

(define tup+
  (lambda (tup1 tup2)
    (cond
      ((null? tup2) tup1)
      ((null? tup1) tup2)
      (else (cons (+ (car tup1) (car tup2)) (tup+ (cdr tup1) (cdr tup2)))))))

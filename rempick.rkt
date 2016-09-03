#lang racket/base

(define rempick
  (lambda (index l)
    (cond
      ((zero? (sub1 index)) (cdr l))
      (else (cons (car l) (rempick (sub1 index) (cdr l)))))))

(provide rempick)

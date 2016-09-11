#lang racket/base

(define set?
  (lambda (l)
    (cond
      ((null? l) #t)
      ((member (car l) (cdr l)) #f)
      (else (set? (cdr l))))))

(provide set?)

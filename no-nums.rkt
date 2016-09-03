#lang racket/base

(define no-nums
  (lambda (l)
    (cond
      ((null? l) '())
      ((number? (car l)) (no-nums (cdr l)))
      (else (cons (car l) (no-nums (cdr l)))))))

(provide no-nums)

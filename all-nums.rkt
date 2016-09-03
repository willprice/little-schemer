#lang racket/base
(define all-nums
  (lambda (l)
    (cond
      ((null? l) '())
      ((not (number? (car l))) (all-nums (cdr l)))
      (else (cons (car l) (all-nums (cdr l)))))))

(provide all-nums)

#lang racket/base

(define multisubst
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else (cons
       (cond ((eq? (car lat) old) new)
             (else (car lat)))
       (multisubst new old (cdr lat)))))))

(provide multisubst)

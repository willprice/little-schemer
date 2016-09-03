#lang racket/base

(define multiinsertL
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      (else
       (cond
         ((eq? (car lat) old)
          (cons new (cons old (multiinsertL new old (cdr lat)))))
         (else
          (cons (car lat) (multiinsertL new old (cdr lat)))))))))

(provide multiinsertL)
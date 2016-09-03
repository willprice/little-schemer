#lang racket/base

(define multiinsertR
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      (else
        (cons (car lat)
              (cond
                ((eq? (car lat) old)
                 (cons new (multiinsertR new old (cdr lat))))
                (else
                  (multiinsertR new old (cdr lat)))))))))

(provide multiinsertR)
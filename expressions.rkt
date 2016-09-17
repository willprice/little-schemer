#lang racket/base

(require "primitives.rkt"
         "numbers.rkt")
(provide
  value
  numbered?)

(define value
  (lambda (nexp)
    (cond
      ((atom? nexp) nexp)
      (else
       ((cond
          ((eq? (operator nexp) '+) +)
          ((eq? (operator nexp) 'x) *)
          (else expt))
         (value (1st-sub-exp nexp))
         (value (2nd-sub-exp nexp)))))))

(define operator
  (lambda (aexp)
    (car (cdr aexp))))

(define 1st-sub-exp
  (lambda (aexp)
    (car aexp)))

(define 2nd-sub-exp
  (lambda (aexp)
    (car (cdr (cdr aexp)))))

(define atom-to-function
  (lambda (x)
    (cond
      ((eq? x '+) my-+)
      ((eq? x '-) my--)
      ((eq? x 'x) my-x)
      (else my-^))))

(define numbered?
  (lambda (aexp)
    (cond
      ((atom? aexp) (number? aexp))
      (else (and (numbered? (car aexp))
                 (numbered? (car (cdr (cdr aexp)))))))))

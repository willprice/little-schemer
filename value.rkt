#lang racket/base
(require "atom.rkt")

(define value
  (lambda (aexp)
    (cond
      ((atom? aexp) aexp)
      (else
       ((cond
          ((eq? (car (cdr aexp)) '+) +)
          ((eq? (car (cdr aexp)) 'x) *)
          (else expt))        
         (value (car aexp))
         (value (car (cdr (cdr aexp)))))))))

(provide value)

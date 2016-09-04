#lang racket/base
(require "atom.rkt")

(define rember*
  (lambda (a l)
    (cond
      ((null? l) '())
      ((atom? (car l)) (cond
                        ((eq? (car l) a)
                         (rember* a (cdr l)))
                        (else (cons (car l)
                                    (rember* a (cdr l))))))
      (else (cons (rember* a (car l))
                  (rember* a (cdr l)))))))

(provide rember*)

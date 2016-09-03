#lang racket/base

(define pick
  (lambda (index l)
    (cond
      ((zero? (sub1 index)) (car l))
      (else (pick (sub1 index) (cdr l))))))

(provide pick)

#lang racket/base

(provide
  eq-c
  rember-f
  insertL-f
  insertR-f
  insert-g)

(define eq-c
  (lambda (a1)
    (lambda (a2)
      (eq? a1 a2))))

(define rember-f
  (lambda (test?)
    (lambda (a l)
      (cond
        ((null? l) '())
        ((test? a (car l)) (cdr l))
        (else (cons (car l)
                    ((rember-f test?) a (cdr l))))))))

(define insertL-f
  (lambda (test?)
    (lambda (new old l)
      (cond
        ((null? l) '())
        ((test? old (car l))
         (cons new
               (cons (car l)
                     (cdr l))))
        (else (cons (car l)
                    ((insertL-f test?) new old (cdr l))))))))
(define insertR-f
  (lambda (test?)
    (lambda (new old l)
      (cond
        ((null? l) '())
        ((test? (car l) old)
         (cons old (cons new (cdr l))))
        (else
          (cons (car l)
                ((insertR-f test?) new old (cdr l))))))))

(define insert-g
  (lambda (test? prepend)
    (lambda (new old l)
      (cond
        ((null? l) '())
        ((test? (car l) old) (prepend new old (cdr l)))
        (else (cons (car l)
                    ((insert-g test? prepend) new old (cdr l))))))))

#lang racket/base

(require "primitives.rkt")
(provide firsts
         rember*
         occur*
         insertR*
         insertL*
         member*
         length)

(define firsts
  (lambda (l)
    (cond
      ((null? l) '())
      (else
       (cons (car (car l))
             (firsts (cdr l)))))))

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

(define occur*
  (lambda (a l)
    (cond
      ((null? l) 0)
      ((atom? (car l))
       (cond
         ((eq? (car l) a) (add1 (occur* a (cdr l))))
         (else (occur* a (cdr l)))))
      (else (+ (occur* a (car l)) (occur* a (cdr l)))))))

(define insertR*
  (lambda (new old l)
    (cond
      ((null? l) '())
      ((atom? (car l))
       (cond
         ((eq? (car l) old) (cons old
                                  (cons new (cdr l))))
         (else (cons (car l)
                     (insertR* new old (cdr l))))))
      (else (cons (insertR* new old (car l)) (insertR* new old (cdr l)))))))

(define insertL*
  (lambda (new old l)
    (cond
      ((null? l) '())
      ((atom? (car l))
       (cond
         ((eq? (car l) old) (cons new l))
         (else (cons (car l)
                     (insertL* new old (cdr l))))))
      (else (cons (insertL* new old (car l))
                  (insertL* new old (cdr l)))))))

(define subst*
  (lambda (new old l)
    (cond
      ((null? l) '())
      ((atom? (car l))
       (cond
         ((eq? (car l) old) (cons new (subst* new old (cdr l))))
         (else (cons (car l) (subst* new old (cdr l))))))
      (else (cons (subst* new old (car l))
                  (subst* new old (cdr l)))))))

(define member*
  (lambda (a l)
    (cond
      ((null? l) #f)
      ((atom? (car l))
       (cond
         ((eq? (car l) a) #t)
         (else (member* a (cdr l)))))
      (else (or (member* a (car l)) (member* a (cdr l)))))))

(define leftmost
  (lambda (l)
    (cond
      ((atom? (car l)) (car l))
      (else (leftmost (car l))))))

(define length
  (lambda (l)
    (cond
      ((null? l) 0)
      (else (add1 (length (cdr l)))))))

; TODO: Test
(define third
  (lambda (l)
    (car (cdr (cdr l)))))

; TODO
(define evens-only*
  (lambda (l)
    l))

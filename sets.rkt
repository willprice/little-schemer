#lang racket/base

(require "lats.rkt")
(provide
  set?
  makeset
  subset?
  eqset?
  intersect?
  intersect
  union
  intersectall)

(define set?
  (lambda (l)
    (cond
      ((null? l) #t)
      ((member (car l) (cdr l)) #f)
      (else (set? (cdr l))))))

(define makeset
  (lambda (l)
    (cond
      ((null? l) '())
      (else
       (cons (car l) (makeset (multirember (car l) (cdr l))))))))

(define subset?
  (lambda (s1 s2)
    (cond
      ((null? s1) #t)
      ((member? (car s1) s2) (subset? (cdr s1) s2))
      (else #f))))

(define eqset?
  (lambda (s1 s2)
    (and
      (subset? s1 s2)
      (subset? s2 s1))))

(define intersect?
  (lambda (s1 s2)
    (cond
      ((null? s1) #f)
      ((member? (car s1) s2) #t)
      (else (intersect? (cdr s1) s2)))))

(define intersect
  (lambda (s1 s2)
    (cond
      ((null? s1) '())
      ((member? (car s1) s2)
       (cons (car s1) (intersect (cdr s1) s2)))
      (else (intersect (cdr s1) s2)))))

(define union
  (lambda (s1 s2)
    (cond
      ((null? s1) s2)
      ((member? (car s1) s2)
       (union (cdr s1) s2))
      (else
       (cons (car s1)
             (union (cdr s1) s2))))))

(define intersectall
  (lambda (l-set)
    (cond
      ((null? (cdr l-set)) (car l-set))
      (else
       (intersect
        (car l-set)
        (intersectall (cdr l-set)))))))

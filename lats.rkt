#lang racket/base

(require "primitives.rkt")
(provide lat?
         member?
         rember
         insertR
         insertL
         subst
         subst2
         multirember
         multiinsertR
         multiinsertL
         multiinsertLR
         pick
         rempick
         no-nums
         all-nums
         occur
         looking)

(define lat?
  (lambda (l)
    (cond
      ((null? l) #t)
      ((atom? (car l)) (lat? (cdr l)))
      (else #f))))

(define member?
  (lambda (sexp l)
    (cond
      ((null? l) #f)
      (else (or (eq? (car l) sexp)
                 (member? sexp (cdr l)))))))

(define rember
  (lambda (s l)
    (cond
      ((null? l) '())
      ((equal? s (car l)) (cdr l))
      (else
       (cons (car l) (rember s (cdr l)))))))

(define insertR
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) old)
       (cons old (cons new (cdr lat))))
      (else (cons (car lat) (insertR new old (cdr lat)))))))

(define insertL
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) old)
       (cons new lat))
      (else
        (cons (car lat) (insertL new old (cdr lat)))))))

(define subst
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) old) (cons new (cdr lat)))
      (else (cons (car lat) (subst new old (cdr lat)))))))

(define subst2
  (lambda (new o1 o2 lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) o1) (cons new (cdr lat)))
      ((eq? (car lat) o2) (cons new (cdr lat)))
      (else (cons (car lat) (subst2 new o1 o2 (cdr lat)))))))

(define multirember
  (lambda (a lat)
    (cond
      ((null? lat) '())
      ((eq? a (car lat)) (multirember a (cdr lat)))
      (else (cons (car lat) (multirember a (cdr lat)))))))

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

(define pick
  (lambda (index l)
    (cond
      ((zero? (sub1 index)) (car l))
      (else (pick (sub1 index) (cdr l))))))

(define rempick
  (lambda (index l)
    (cond
      ((zero? (sub1 index)) (cdr l))
      (else (cons (car l) (rempick (sub1 index) (cdr l)))))))

(define no-nums
  (lambda (lat)
    (cond
      ((null? lat) '())
      ((number? (car lat)) (no-nums (cdr lat)))
      (else (cons (car lat) (no-nums (cdr lat)))))))

(define all-nums
  (lambda (lat)
    (cond
      ((null? lat) '())
      ((not (number? (car lat))) (all-nums (cdr lat)))
      (else (cons (car lat) (all-nums (cdr lat)))))))

(define occur
  (lambda (a lat)
    (cond
      ((null? lat) 0)
      ((eq? (car lat) a) (add1 (occur a (cdr lat))))
      (else (occur a (cdr lat))))))

(define multiinsertLR
  (lambda (new oldL oldR lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) oldL)
       (cons new lat))
      ((eq? (car lat) oldR)
       (cons oldR (cons new (cdr lat))))
      (else (cons (car lat) (multiinsertLR new oldL oldR (cdr lat)))))))

(define looking
  (lambda (a lat)
    (keep-looking a (pick 1 lat) lat)))

(define keep-looking
  (lambda (a sorn lat)
    (cond
      ((number? (pick sorn lat))
       (keep-looking a (pick sorn lat) lat))
      (else
        (eq? a (pick sorn lat))))))

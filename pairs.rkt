#lang racket/base

(require "primitives.rkt")
(provide
  a-pair?
  first
  second
  build
  revpair
  shift
  weight*
  length*
  shuffle)

(define a-pair?
  (lambda (l)
    (cond
      ((null? l) #f)
      ((atom? l) #f)
      ((null? (cdr l)) #f)
      ((null? (cdr (cdr l))) #t))))

(define first
  (lambda (pair)
    (car pair)))

(define second
  (lambda (pair)
    (car (cdr pair))))

(define build
  (lambda (s1 s2)
    (cons s1
          (cons s2 '()))))

(define revpair
  (lambda (pair)
    (build (second pair) (first pair))))

(define shift
  (lambda (pair)
    (build (first (first pair))
           (build (second (first pair))
                  (second pair)))))

(define length*
  (lambda (pora)
    (cond
      ((atom? pora) 1)
      (else
        (+ (length* (first pora))
           (length* (second pora)))))))

(define weight*
  (lambda (pora)
    (cond
      ((atom? pora) 1)
      (else
        (+ (* (weight* (first pora)))
           (weight* (second pora)))))))

; This is not *total*, be careful
; '((a b) (c d)) recurses endlessly
(define shuffle
  (lambda (pora)
    (cond
      ((atom? pora) pora)
      ((a-pair? (first pora))
       (shuffle (revpair pora)))
      (else (build (first pora)
                   (shuffle (second pora)))))))


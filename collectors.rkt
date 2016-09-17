#lang racket/base
(require "primitives.rkt") 
(provide
  multirember&co
  multiinsertLR&co
  evens-only*&co)

(define multirember&co
  ; This isn't a very well named function as we're not really removing
  ; items from the list, we're splitting the list into two lists that
  ; are collected by means of building up nested lambdas.
  ;
  ; The collector `col` has the signature `(no-match-l match-l)` where
  ; `no-match-l` is a list that consists of all the elements not
  ; matching `a` from `lat` and `match-l` consists of all the elements
  ; that match `a` from `lat`. See the tests for concrete examples.
  (lambda (a lat col)
    (cond
      ((null? lat)
       (col '() '()))
      ((eq? (car lat) a)
       (multirember&co a (cdr lat)
                       (lambda (newlat seen)
                         (col newlat
                              (cons (car lat) seen)))))
      (else
        (multirember&co a (cdr lat)
                        (lambda (newlat seen)
                          (col (cons (car lat) newlat)
                               seen)))))))

(define multiinsertLR&co
  (lambda (new oldL oldR lat col)
    (cond
      ((null? lat)
       (col '() 0 0))
      ((eq? (car lat) oldL)
       (multiinsertLR&co new oldL oldR (cdr lat)
                         (lambda (acc leftInsertions rightInsertions)
                           (col (cons new (cons oldL acc))
                                (add1 leftInsertions)
                                rightInsertions))))
      ((eq? (car lat) oldR)
       (multiinsertLR&co new oldL oldR (cdr lat)
                         (lambda (acc leftInsertions rightInsertions)
                           (col (cons oldR (cons new acc))
                                leftInsertions
                                (add1 rightInsertions)))))
      (else
        (multiinsertLR&co new oldL oldR (cdr lat)
                          (lambda (acc leftInsertions rightInsertions)
                            (col (cons (car lat) acc)
                                 leftInsertions
                                 rightInsertions)))))))

; This is a monstrosity, let's hope we learn modularisation soon.
(define evens-only*&co
  (lambda (l col)
    (cond
      ((null? l)
       (col '() 1 0))
      ((atom? (car l))
       (cond
         ((even? (car l))
          (evens-only*&co
            (cdr l)
            (lambda (evens-l evens-product odds-sum)
              (col (cons (car l)
                         evens-l)
                   (* (car l)
                      evens-product)
                   odds-sum))))
         (else
           (evens-only*&co
             (cdr l)
             (lambda (evens-l evens-product odds-sum)
               (col evens-l
                    evens-product
                    (+ (car l)
                       odds-sum)))))))
      (else
        ; The idea here is that we recurse into the car, and our
        ; collector handles recursing into the cdr. The cdr collector
        ; then combines the result as it has access to the results for
        ; both the car and cdr
        (evens-only*&co
          (car l)
          (lambda (car-evens-l car-evens-product car-odds-sum)
            (evens-only*&co
              (cdr l)
              (lambda (cdr-evens-l cdr-evens-product cdr-odds-sum)
                (col
                  (cons car-evens-l cdr-evens-l)
                  (* car-evens-product cdr-evens-product)
                  (+ car-odds-sum cdr-odds-sum))))))))))

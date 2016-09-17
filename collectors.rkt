#lang racket/base
(provide
  multirember&co)

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

;(define multiinsertLR&co (a lat col))
;(define evens-only*&co (l col))

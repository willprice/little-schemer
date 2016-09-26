#lang racket/base

(require "pairs.rkt")
(provide
  new-entry
  look-up-in-entry
  extend-table
  look-in-table)

(define new-entry
  build)

(define look-up-in-entry
  (lambda (name entry entry-f)
    (look-up-in-entry-helper name (first entry) (second entry)
                             entry-f)))

(define look-up-in-entry-helper
  (lambda (name names vals entry-f)
    (cond
      ((null? names)
       (entry-f name))
      ((eq? (car names) name)
       (car vals))
      (else (look-up-in-entry
              name
              (build (cdr names)
                     (cdr vals))
              entry-f)))))

(define extend-table
  cons)

(define look-in-table
  (lambda (name table table-f)
    (cond
      ((null? table) (table-f name))
      (else (look-up-in-entry name (car table)
                              (lambda (name)
                                (look-in-table name (cdr table)
                                               table-f)))))))

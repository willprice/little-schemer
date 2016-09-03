#lang racket/base

(require rackunit
         "../multisubst.rkt")

(check-equal? (multisubst 'new 'old '()) '() "Substituting items in an empty list")
(check-equal? (multisubst 'new 'old '(item)) '(item) "Substituting non existant item in non empty list")
(check-equal? (multisubst 'new 'old '(old)) '(new) "Substituting single item in single entry list")
(check-equal? (multisubst 'new 'old '(old item)) '(new item) "Substituting single item in a two enty list")
(check-equal? (multisubst 'new 'old '(old item old item)) '(new item new item) "Substituting two items in a four entry list")

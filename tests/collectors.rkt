#lang racket/base

(require rackunit
         "../collectors.rkt")

(define join-lists-to-pair
  (lambda (l1 l2)
    (cons l1 (cons l2 '()))))

(test-case
  "multirember&co"
  (check-equal?
    (multirember&co 'a '() join-lists-to-pair)
    '(() ()))
  (check-equal?
    (multirember&co
      'a '(a)
      join-lists-to-pair)
    '(() (a)))
  (check-equal?
    (multirember&co
      'a '(b)
      join-lists-to-pair)
    '((b) ()))
  (check-equal?
    (multirember&co
      'a '(a b c)
      join-lists-to-pair)
    '((b c) (a))))

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

(define multiinsertLR&co-collector
  (lambda (lat leftInsertions rightInsertions)
    (cons leftInsertions
          (cons rightInsertions
                (cons lat '())))))

(test-case
  "multiinsertLR&co"
  (check-equal?
    (multiinsertLR&co
      'new 'oldL 'oldR '()
      multiinsertLR&co-collector)
    '(0 0 ()))
  (check-equal?
    (multiinsertLR&co
      'new 'oldL 'oldR '(a)
      multiinsertLR&co-collector)
    '(0 0 (a)))
  (check-equal?
    (multiinsertLR&co
      'new 'oldL 'oldR '(oldL)
      multiinsertLR&co-collector)
    '(1 0 (new oldL)))
  (check-equal?
    (multiinsertLR&co
      'new 'oldL 'oldR '(oldR)
      multiinsertLR&co-collector)
    '(0 1 (oldR new)))
  (check-equal?
    (multiinsertLR&co
      'new 'oldL 'oldR '(a b oldL c oldR d oldR)
      multiinsertLR&co-collector)
    '(1 2 (a b new oldL c oldR new d oldR new))))

(define evens-only*&co-collector
  (lambda (evens-only-lat evens-product odds-sum)
    (cons evens-product
          (cons odds-sum
                (cons evens-only-lat '())))))
(test-case
  "evens-only*&co"
  (check-equal?
    (evens-only*&co '() evens-only*&co-collector)
    '(1 0 ()))
  (check-equal?
    (evens-only*&co '(2) evens-only*&co-collector)
    '(2 0 (2)))
  (check-equal?
    (evens-only*&co '(1) evens-only*&co-collector)
    '(1 1 ()))
  (check-equal?
    (evens-only*&co '(1 2) evens-only*&co-collector)
    '(2 1 (2)))
  (check-equal?
    (evens-only*&co '(2 2) evens-only*&co-collector)
    '(4 0 (2 2)))
  (check-equal?
    (evens-only*&co '((2) 2) evens-only*&co-collector)
    '(4 0 ((2) 2)))
  (check-equal?
    (evens-only*&co '((2) 1 ((3)) ((4) 7) (8) 2) evens-only*&co-collector)
    '(128 11 ((2) (()) ((4)) (8) 2))))

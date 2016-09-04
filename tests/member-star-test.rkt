#lang racket/base

(require rackunit
         "../member-star.rkt")

(check-equal? (member* 'a '()) #f)
(check-equal? (member* 'a '(a)) #t)
(check-equal? (member* 'a '(b a)) #t)
(check-equal? (member* 'a '((a))) #t)
(check-equal? (member* 'chips '((potato (chips ((with) fish)) (chips)))) #t)
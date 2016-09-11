#lang racket/base

(require rackunit
         "../fun-p.rkt")

(check-equal? (fun? '()) #t)
(check-equal? (fun? '((4 5) (4 3))) #f)

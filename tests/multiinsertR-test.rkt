#lang racket/base

(require rackunit
         "../multiinsertR.rkt")

(check-equal? (multiinsertR 'new 'old '()) '() "Base case")
(check-equal? (multiinsertR 'new 'old '(old)) '(old new) "Single recursion")
(check-equal? (multiinsertR 'new 'old '(old and old)) '(old new and old new) "Full recursion")

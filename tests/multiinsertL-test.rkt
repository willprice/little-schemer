#lang racket/base

(require rackunit
         "../multiinsertL.rkt")

(check-equal? '() (multiinsertL 'new 'old '()))
(check-equal? '(item) (multiinsertL 'new 'old '(item)))
(check-equal? '(new old) (multiinsertL 'new 'old '(old)))
(check-equal? '(new old some items new old) (multiinsertL 'new 'old '(old some items old)))

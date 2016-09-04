#lang racket/base

(require rackunit
         "../rember-star.rkt")

(check-equal? (rember* 'a '()) '())
(check-equal? (rember* 'a '(b)) '(b))
(check-equal? (rember* 'a '(a)) '())
(check-equal? (rember* 'a '(a a)) '())
(check-equal? (rember* 'a '(b a)) '(b))
(check-equal? (rember* 'a '((a))) '(()))
(check-equal? (rember* 'cup '((coffee) cup ((tea) cup) (and (hick)) cup))
              '((coffee) ((tea)) (and (hick))))
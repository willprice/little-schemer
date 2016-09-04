#lang racket/base

(require rackunit
         "../eqlist.rkt")

(check-equal? (eqlist? '() '()) #t)
(check-equal? (eqlist? '() '(a)) #f)
(check-equal? (eqlist? '(a) '(b)) #f)
(check-equal? (eqlist? '(a a) '(a b)) #f)
(check-equal? (eqlist? '((a)) '((b))) #f)
(check-equal? (eqlist? '((a)) '((a))) #t)
(check-equal? (eqlist? '((a) a) '((a) b)) #f)
(check-equal? (eqlist? '(beef ((sausage)) (and soda))
                      '(beef ((sausage)) (and soda)))
              #t)
(check-equal? (eqlist? '(beef ((sausage)) (and (soda)))
                      '(beef ((salami)) (and (soda))))
              #f)

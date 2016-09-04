#lang racket/base

(require rackunit
         "../occur-star.rkt")

(check-equal? (occur* 'a '()) 0)
(check-equal? (occur* 'a '(a)) 1)
(check-equal? (occur* 'a '(b)) 0)
(check-equal? (occur* 'a '(a a)) 2)
(check-equal? (occur* 'a '(b a)) 1)
(check-equal? (occur* 'a '((a))) 1)
(check-equal? (occur* 'banana '((banana)
                                (split ((((banana ice)))
                                        (cream (banana))
                                        sherbet))
                                (banana)
                                (bread)
                                (banana brandy)))
              5)
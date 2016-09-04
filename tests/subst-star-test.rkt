#lang racket/base

(require rackunit
         "../subst-star.rkt")

(check-equal? (subst* 'new 'old '()) '())
(check-equal? (subst* 'new 'old '(a)) '(a))
(check-equal? (subst* 'new 'old '(old)) '(new))
(check-equal? (subst* 'new 'old '(a old)) '(a new))
(check-equal? (subst* 'new 'old '(old old)) '(new new))
(check-equal? (subst* 'new 'old '((old))) '((new)))
(check-equal? (subst* 'orange 'banana '((banana)
                                        (split ((((banana ice)))
                                                (cream (banana))
                                                sherbet))
                                        (banana)
                                        (bread)
                                        (banana brandy)))
              '((orange)
                (split ((((orange ice)))
                        (cream (orange))
                        sherbet))
                (orange)
                (bread)
                (orange brandy)))
                                                
                                                       
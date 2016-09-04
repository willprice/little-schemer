#lang racket/base

(require rackunit
         "../insertL-star.rkt")

(check-equal? (insertL* 'new 'old '()) '())
(check-equal? (insertL* 'new 'old '(a)) '(a))
(check-equal? (insertL* 'new 'old '(old)) '(new old))
(check-equal? (insertL* 'new 'old '(a old)) '(a new old))
(check-equal? (insertL* 'new 'old '((old))) '((new old)))
(check-equal? (insertL* 'pecker 'chuck '((how much (wood))
                                         could
                                         ((a (wood) chuck))
                                         (((chuck)))
                                         (if (a) ((wood chuck)))
                                         could chuck wood))
              '((how much (wood))
                could
                ((a (wood) pecker chuck))
                (((pecker chuck)))
                (if (a) ((wood pecker chuck)))
                could pecker chuck wood))
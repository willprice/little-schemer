#lang racket/base

(require rackunit
         "../insertR-star.rkt")

(check-equal? (insertR* 'new 'old '()) '())
(check-equal? (insertR* 'new 'old '(a)) '(a))
(check-equal? (insertR* 'new 'old '(old)) '(old new))
(check-equal? (insertR* 'new 'old '(a old)) '(a old new))
(check-equal? (insertR* 'new 'old '((old))) '((old new)))
(check-equal? (insertR* 'roast 'chuck '((how much (wood))
                                            could
                                            ((a (wood) chuck))
                                            (((chuck)))
                                            (if (a) ((wood chuck)))
                                            could chuck wood))
              '((how much (wood))
                could
                ((a (wood) chuck roast))
                (((chuck roast)))
                (if (a) ((wood chuck roast)))
                could chuck roast wood))

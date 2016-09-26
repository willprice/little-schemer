#lang racket/base

(require rackunit
         "../tables.rkt")

(test-case
  "new-entry"
  (check-equal? (new-entry '(a) '(b)) '((a) (b))))

(test-case
  "look-up-in-entry"
  (check-equal? (look-up-in-entry 'a '((a) (b)) (lambda (_) null))
                'b)
  (check-equal? (look-up-in-entry 'a '((b a) (c d)) (lambda (_) null))
                'd)
  (look-up-in-entry 'a
                    '((b) (b))
                    (lambda (name)
                      (check-equal? name 'a))))

(test-case
  "extend-table"
  (check-equal? (extend-table '((a) (b)) '(((c) (d))))
                '(((a) (b)) ((c) (d)))))

(test-case
  "look-in-table"
  (check-equal? (look-in-table 'a '(((a) (b))) (lambda (_) null))
                'b)
  (check-equal? (look-in-table 'c '(((a) (b)) ((c) (d))) (lambda (_) null))
                'd)
  (check-equal? (look-in-table 'e '(((a) (b)) ((c) (d))) (lambda (x) x))
                'e))

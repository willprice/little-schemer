#lang racket/base

(require rackunit
         "../value.rkt")

(test-case
  "value"
  (check-equal? (value 1) 1)
  (check-equal? (value '#t) #t)
  (check-equal? (value '#f) #f)
  (check-equal? (value '(quote a)) 'a)
  (check-equal? (value '(quote (1))) '(1))
  (check-equal? (value '(cons 2 (quote (1)))) '(2 1))
  (check-equal? (value '(car '(1))) 1)
  (check-equal? (value '(cdr (quote (1 2)))) '(2))
  (check-equal? (value '(null? (quote ()))) #t)
  (check-equal? (value '(eq? (quote a) (quote b))) #f)
  (check-equal? (value '(atom? (quote a))) #t)
  (check-equal? (value '(atom? (quote (a)))) #f)
  (check-equal? (value '(zero? 0)) #t)
  (check-equal? (value '(zero? 1)) #f)
  (check-equal? (value '(add1 1)) 2)
  (check-equal? (value '(sub1 1)) 0)
  (check-equal? (value '(number? 1)) #t)
  (check-equal? (value '(number? (quote a))) #f)
  (check-equal? (value '(cond (else 1))) 1)
  (check-equal? (value '(cond (#t 1)
                              (else 2))) 1)
  (check-equal? (value '((lambda (x) (add1 x)) 1)) 2)
  (check-equal? (value '((lambda (x y) (eq? x y)) 1 1)) #t)
  (check-equal? (value '((lambda (x y) (eq? x y)) 1 2)) #f)
  (check-equal? (value '((lambda (x y) (cons x y)) 1 '(2))) '(1 2))
  (check-equal? (value '((lambda (x) (x (quote (1 2)))) cdr)) '(2))
  (check-equal? (value '(((lambda (le)
                           ((lambda (f) (f f))
                            (lambda (f)
                              (le (lambda (x) ((f f) x))))))
                         (lambda (length)
                           (lambda (l)
                             (cond
                               ((null? l) 0)
                               (else (add1 (length (cdr l))))))))
                         '(a b c))) 3))

(test-case
  "atom-to-action"
  (check-equal? (atom-to-action '1) *const)
  (check-equal? (atom-to-action '#t) *const)
  (check-equal? (atom-to-action '#f) *const)
  (check-equal? (atom-to-action 'cons) *const)
  (check-equal? (atom-to-action 'car) *const)
  (check-equal? (atom-to-action 'cdr) *const)
  (check-equal? (atom-to-action 'null?) *const)
  (check-equal? (atom-to-action 'eq?) *const)
  (check-equal? (atom-to-action 'atom?) *const)
  (check-equal? (atom-to-action 'zero?) *const)
  (check-equal? (atom-to-action 'add1) *const)
  (check-equal? (atom-to-action 'sub1) *const)
  (check-equal? (atom-to-action 'number?) *const)
  (check-equal? (atom-to-action 'my-fun) *identifier))

(test-case
  "list-to-action"
  (check-equal? (list-to-action '(lambda (x) x)) *lambda)
  (check-equal? (list-to-action '(quote x)) *quote)
  (check-equal? (list-to-action '(cond ((x y) (else z)))) *cond)
  (check-equal? (list-to-action '(my-fun x)) *application)
  (check-equal? (list-to-action '((fun-generator x) y)) *application))

(test-case
  "*const"
  (check-equal? (*const '1 initial-table) 1)
  (check-equal? (*const '#t initial-table) #t)
  (check-equal? (*const '#f initial-table) #f)
  (check-equal? (*const 'car initial-table) '(primitive car)))

(test-case
  "*identifier"
  (check-equal? (*identifier 'a '(((a) (1)))) 1)
  (check-equal? (*identifier 'a '(((a) (2)))) 2)
  (check-equal? (*identifier 'a '(((a) (1)) ((a) (2)))) 1))

(test-case
  "*quote"
  (check-equal? (*quote '(quote a) initial-table) 'a))

(test-case
  "*lambda"
  (check-equal? (*lambda '(lambda (a) (add1 a)) '(((x) (1))))
                '(non-primitive
                   ((((x) (1)))
                    (a)
                    (add1 a)))))

(test-case
  "apply-primitive"
  (check-equal? (apply-primitive 'eq? '(a b)) #f)
  (check-equal? (apply-primitive 'eq? '(a a)) #t)
  (check-equal? (apply-primitive 'car '((a))) 'a)
  (check-equal? (apply-primitive 'cdr '((a))) '())
  (check-equal? (apply-primitive 'cdr '((a b))) '(b))
  (check-equal? (apply-primitive 'cons '(a (b))) '(a b))
  (check-equal? (apply-primitive 'number? '(a)) #f)
  (check-equal? (apply-primitive 'number? '(1)) #t)
  (check-equal? (apply-primitive 'zero? '(0)) #t)
  (check-equal? (apply-primitive 'zero? '(1)) #f)
  (check-equal? (apply-primitive 'add1 '(1)) 2)
  (check-equal? (apply-primitive 'sub1 '(1)) 0)
  (check-equal? (apply-primitive 'null? '(())) #t)
  (check-equal? (apply-primitive 'null? '((a))) #f)
  (check-equal? (apply-primitive 'atom? '(())) #f)
  (check-equal? (apply-primitive 'atom? '(a)) #t)
  (check-equal? (apply-primitive 'atom? '(1)) #t))



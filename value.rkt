#lang racket/base

(require "primitives.rkt")
(require "pairs.rkt")
(require "tables.rkt")
(require "lists.rkt")

(provide
  atom-to-action
  list-to-action
  initial-table
  *identifier
  *const
  *quote
  *lambda
  *cond
  *application
  apply-primitive
  value)

(define value
  (lambda (e)
    (meaning e '())))

(define meaning
  (lambda (e table)
    ((expression-to-action e) e table)))

(define expression-to-action
  (lambda (e)
    (cond
      ((atom? e) (atom-to-action e))
      (else (list-to-action e)))))

(define atom-to-action
  (lambda (e)
    (cond
      ((or (number? e)
           (eq? e #t)
           (eq? e #f)
           (eq? e 'cons)
           (eq? e 'car)
           (eq? e 'cdr)
           (eq? e 'null?)
           (eq? e 'eq?)
           (eq? e 'atom?)
           (eq? e 'zero?)
           (eq? e 'add1)
           (eq? e 'sub1)
           (eq? e 'number?))
       *const)
      (else *identifier))))

(define list-to-action
  (lambda (e)
    (cond
      ((equal? (car e) 'lambda) *lambda)
      ((equal? (car e) 'quote) *quote)
      ((equal? (car e) 'cond) *cond)
      (else *application))))

(define *const
  (lambda (e table)
    (cond
      ((or
         (number? e)
         (eq? e #t)
         (eq? e #f))
       e)
      (else (build 'primitive e)))))

(define *identifier
  (lambda (e table)
    (look-in-table e table initial-table)))

(define *quote
  (lambda (e table)
    (text-of e)))

(define text-of second)

(define *lambda
  (lambda (e table)
    (build
      'non-primitive
      (cons table (cdr e)))))

(define *cond
  (lambda (e table)
    (evcon (cond-lines-of e) table)))

(define cond-lines-of cdr)

(define evcon
  (lambda (lines table)
    (cond
      ((else? (question-of (car lines)))
       (meaning (answer-of (car lines)) table))
      ((meaning (question-of (car lines)) table)
       (meaning (answer-of (car lines)) table))
      (else (evcon (cdr lines) table)))))
(define else?
  (lambda (question)
    (cond
      ((atom? question) (eq? question 'else))
      (else #f))))
(define question-of first)
(define answer-of second)

(define *application
  (lambda (e table)
    (apply
      (meaning (car e) table)
      (evlis (cdr e) table))))

(define evlis
  (lambda (args table)
    (cond
      ((null? args) '())
      (else
        (cons (meaning (car args) table)
              (evlis (cdr args) table))))))

(define apply
  (lambda (fun vals)
    (cond
      ((primitive? fun)
       (apply-primitive
         (second fun) vals))
      ((non-primitive? fun)
       (apply-closure
         (second fun) vals)))))

(define primitive?
  (lambda (l)
    (eq? (first l) 'primitive)))

(define non-primitive?
  (lambda (l)
    (eq? (first l) 'non-primitive)))

(define apply-primitive
  (lambda (name vals)
    (cond
      ((eq? name 'car)
       (car (first vals)))
      ((eq? name 'cdr)
       (cdr (first vals)))
      ((eq? name 'cons)
       (cons (first vals) (second vals)))
      ((eq? name 'add1)
       (add1 (first vals)))
      ((eq? name 'sub1)
       (sub1 (first vals)))
      ((eq? name 'zero?)
       (zero? (first vals)))
      ((eq? name 'number?)
       (number? (first vals)))
      ((eq? name 'eq?)
       (eq? (first vals) (second vals)))
      ((eq? name 'null?)
       (null? (first vals)))
      ((eq? name 'atom?)
       (:atom? (first vals))))))

(define :atom?
  (lambda (x)
    (cond
      ((atom? x) #t)
      ((null? x) #f)
      ((eq? (car x) (quote primitive)) #t)
      ((eq? (car x) (quote non-primitive)) #t)
      (else #f))))

; Closures take the form of
; (table formal-args body)
(define apply-closure
  (lambda (closure vals)
    (meaning (body-of closure)
      (extend-table
        (new-entry
          (formals-of closure)
          vals)
        (table-of closure)))))
(define table-of first)
(define formals-of second)
(define body-of third)

(define initial-table
  (lambda (name)
    (error
      (format "Table lookup for ~a failed" name))))

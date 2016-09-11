#lang racket/base

(require rackunit
         "../build.rkt")

(check-equal? (build 'a 'b) '(a b))

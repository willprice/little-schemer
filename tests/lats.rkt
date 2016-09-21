#lang racket/base

(require rackunit
         "../lats.rkt")

(test-case
  "lat?"
  (check-equal? (lat? '()) #t)
  (check-equal? (lat? '(a)) #t)
  (check-equal? (lat? '(a '())) #f)
  (check-equal? (lat? '(a b)) #t))

(test-case
  "member?"
  (check-equal? (member? 'a '()) #f)
  (check-equal? (member? 'a '(a)) #t)
  (check-equal? (member? 'a '(b)) #f)
  (check-equal? (member? 'a '(b a)) #t))

(test-case
  "rember"
  (check-equal? (rember 'a '()) '())
  (check-equal? (rember 'a '(b)) '(b))
  (check-equal? (rember 'a '(a)) '())
  (check-equal? (rember 'a '(b a)) '(b))
  (check-equal? (rember '(a) '((a))) '())
  (check-equal? (rember 'a '((a b) a b)) '((a b) b)))

(test-case
  "insertR"
  (check-equal? (insertR 'new 'old '()) '())
  (check-equal? (insertR 'new 'old '(a)) '(a))
  (check-equal? (insertR 'new 'old '(a b)) '(a b))
  (check-equal? (insertR 'new 'old '(old)) '(old new))
  (check-equal? (insertR 'new 'old '(old old)) '(old new old)))

(test-case
  "insertL"
  (check-equal? (insertL 'new 'old '()) '())
  (check-equal? (insertL 'new 'old '(a)) '(a))
  (check-equal? (insertL 'new 'old '(a b)) '(a b))
  (check-equal? (insertL 'new 'old '(old)) '(new old))
  (check-equal? (insertL 'new 'old '(old old)) '(new old old)))

(test-case
  "subst"
  (check-equal? (subst 'new 'old '()) '())
  (check-equal? (subst 'new 'old '(a)) '(a))
  (check-equal? (subst 'new 'old '(a b)) '(a b))
  (check-equal? (subst 'new 'old '(old)) '(new))
  (check-equal? (subst 'new 'old '(old old)) '(new old)))

(test-case
  "subst2"
  (check-equal? (subst2 'new 'old1 'old2 '()) '())
  (check-equal? (subst2 'new 'old1 'old2 '(a)) '(a))
  (check-equal? (subst2 'new 'old1 'old2 '(a b)) '(a b))
  (check-equal? (subst2 'new 'old1 'old2 '(old1)) '(new))
  (check-equal? (subst2 'new 'old1 'old2 '(old1 old1)) '(new old1))
  (check-equal? (subst2 'new 'old1 'old2 '(old2)) '(new))
  (check-equal? (subst2 'new 'old1 'old2 '(old2 old2)) '(new old2))
  (check-equal? (subst2 'new 'old1 'old2 '(old2 old1)) '(new old1)))

(test-case
  "multirember"
  (check-equal? (multirember 'a '()) '())
  (check-equal? (multirember 'a '(b)) '(b))
  (check-equal? (multirember 'a '(b c)) '(b c))
  (check-equal? (multirember 'a '(a)) '())
  (check-equal? (multirember 'a '(b a)) '(b)))

(test-case
  "multiinsertR"
  (check-equal? (multiinsertR 'new 'old '()) '() "Base case")
  (check-equal? (multiinsertR 'new 'old '(old)) '(old new) "Single recursion")
  (check-equal? (multiinsertR 'new 'old '(old and old)) '(old new and
                                                              old new)
                "Full recursion"))

(test-case
  "multiinsertL"
  (check-equal? '() (multiinsertL 'new 'old '()))
  (check-equal? '(item) (multiinsertL 'new 'old '(item)))
  (check-equal? '(new old) (multiinsertL 'new 'old '(old)))
  (check-equal? '(new old some items new old) (multiinsertL 'new 'old
                                                            '(old some
                                                                  items
                                                                  old))))

(test-case
  "pick"
  (check-equal? (pick 1 '(a)) 'a)
  (check-equal? (pick 2 '(a b)) 'b)
  (check-equal? (pick 5 '(a b c d e f)) 'e))

(test-case
  "rempick"
  (check-equal? (rempick 1 '(a)) '())
  (check-equal? (rempick 1 '(a b)) '(b))
  (check-equal? (rempick 2 '(a b)) '(a))
  (check-equal? (rempick 3 '(hotdogs with hot mustard)) '(hotdogs with mustard)))

(test-case
  "no-nums"
  (check-equal? (no-nums '()) '())
  (check-equal? (no-nums '(a)) '(a))
  (check-equal? (no-nums '(1)) '())
  (check-equal? (no-nums '(1 a)) '(a))
  (check-equal? (no-nums '(1 a 1)) '(a)))

(test-case
  "all-nums"
  (check-equal? (all-nums '()) '())
  (check-equal? (all-nums '(1)) '(1))
  (check-equal? (all-nums  '(a 1)) '(1))
  (check-equal? (all-nums '(a a 1)) '(1))
  (check-equal? (all-nums '(1 a)) '(1))
  (check-equal? (all-nums '(1 1)) '(1 1)))

(test-case
  "occur"
  (check-equal? (occur 'a '()) 0)
  (check-equal? (occur 'a '(a)) 1)
  (check-equal? (occur 'a '(b a)) 1)
  (check-equal? (occur 'a '(a a)) 2))

(test-case
  "multiinsertLR"
  (check-equal? (multiinsertLR 'new 'oldL 'oldR '()) '())
  (check-equal? (multiinsertLR 'new 'oldL 'oldR '(a)) '(a))
  (check-equal? (multiinsertLR 'new 'oldL 'oldR '(a b)) '(a b))
  (check-equal? (multiinsertLR 'new 'oldL 'oldR '(oldL)) '(new oldL))
  (check-equal? (multiinsertLR 'new 'oldL 'oldR '(oldR)) '(oldR new))
  (check-equal? (multiinsertLR 'new 'oldL 'oldR '(oldL oldR))
                '(new oldL oldR))
  (check-equal? (multiinsertLR 'new 'oldL 'oldR '(oldR oldL))
                '(oldR new oldL)))

(test-case
  "looking"
  (check-equal? (looking 'a '(2 a)) #t)
  (check-equal? (looking 'a '(2 b)) #f)
  (check-equal? (looking 'a '(4 a b 2)) #t)
  (check-equal? (looking 'a '(4 b a 2)) #f))

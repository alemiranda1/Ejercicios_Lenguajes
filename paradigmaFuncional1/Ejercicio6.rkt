#lang racket/base

(define (merge lst1 lst2)
  (cond ((null? lst1) lst2)
        ((null? lst2) lst1)
        ((< (car lst1) (car lst2))
         (cons (car lst1) (merge (cdr lst1) lst2)))
        (else
         (cons (car lst2) (merge lst1 (cdr lst2))))))

(merge '(1 2 3 4) '(5 6 7 8))

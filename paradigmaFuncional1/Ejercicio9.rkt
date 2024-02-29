#lang racket/base

(define L '(4 6 7 3 8 2 9 7))

(define (eliminar E L)
  ( cond ( (null? L)
           '())
         ( (equal? E (car L))
           (eliminar E (cdr L)))
         (else
          (cons (car L) (eliminar E (cdr L)))
          )
         )
  )
  
(eliminar 3 L)

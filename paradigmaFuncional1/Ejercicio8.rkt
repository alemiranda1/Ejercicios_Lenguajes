#lang racket/base

(define (subconjunto? L1 L2)
   (andmap (lambda (x)
             (cond ((member x L2)
                    #t)
                   (else
                    #f)))
           L1))

(subconjunto? '(1 3 5) '(1 3 2 4 5))
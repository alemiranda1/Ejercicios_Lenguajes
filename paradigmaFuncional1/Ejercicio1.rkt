#lang racket/base

(define (ahorros Cap I N)
  (let ((monto (* Cap (expt (+ 1 I) N))))
    (exact->inexact monto))) 


(ahorros 2000 0.10 1)

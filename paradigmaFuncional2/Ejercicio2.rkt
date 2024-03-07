#lang racket/base

(require racket/string)

(define (sub_cadenas subcadena lista)
  (filter (lambda (cadena)
            (string-contains? cadena subcadena))
          lista))

(sub_cadenas "la" '("la casa" "el perro" "pintando la cerca"))



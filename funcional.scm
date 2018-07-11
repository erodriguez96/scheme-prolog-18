(require racket/trace)
;; Use (trace nombrefunción) para activar el seguimiento de ejecución de una función


(define (ordenada lst)
    (cond
        ((null? lst) #t)
        ((null? (cdr lst)) #t)
        ((<= (car lst) (cadr lst) ) (ordenada (cdr lst)) )
        (else #f)
    )    
)

(define (quitaRepetidos lst)
    (cond
        ((null? lst) '())
        ((null? (cdr lst)) (list (car lst)))
        ((not(eqv? (car lst) (cadr lst))) (cons (car lst) (quitaRepetidos(cdr lst))) )
        (else (quitaRepetidos(cdr lst)))
    )
)

(define (cuenta lst n)
    (nveces (aplana lst) n)
)

(define (aplana lst)
    (cond
        ((null? lst) '())
        ((list? (car lst)) (append (aplana (car lst)) (aplana (cdr lst)) ))
        ((not(list? (car lst))) (cons (car lst) (aplana (cdr lst))))
    )    
)

(define (nveces lst n)
    (cond
        ((null? lst) 0)
        ((eqv? (car lst) n) (+ (nveces (cdr lst) n) 1) )
        (else (nveces (cdr lst) n))
    )
)

; (display (ordenada '()))
; (newline)
; (display (ordenada '(1 2 3 3)))
; (newline)
; (display (ordenada '(1 2 3 2)))
; (newline)
; (display (quitaRepetidos '() ))
; (newline)
; (display (quitaRepetidos '(1 1 2 1 1 2) ))
; (newline)
; (display (quitaRepetidos '(1 2 1 1 1 1 2 2 1) ))
; (trace cuenta)
; (trace aplana)
; (trace nveces)
; (newline)
; (display (cuenta '(a b a (b c (a)) a) 'a ))
; (newline)
; (display (cuenta '(a b a) 'a ))
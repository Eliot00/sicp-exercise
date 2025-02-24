(define (fringe lst)
  (cond ((null? lst) lst)
        ((not (pair? lst)) (list lst))
        (else (append (fringe (car lst))
                       (fringe (cdr lst))))))

(define x (list (list 1 2) (list 3 4)))
(display (fringe (list x x)))


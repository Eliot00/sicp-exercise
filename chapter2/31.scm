(define (tree-map fn tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (fn tree))
        (else (cons (tree-map fn (car tree))
                    (tree-map fn (cdr tree))))))


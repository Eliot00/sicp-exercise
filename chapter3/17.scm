(define (count-pairs x)
  (let ([seen '()])
    (define (iter x)
      (if (or (not (pair? x)) (memq x seen))
          0
          (begin (set! seen (cons x seen))
                 (+ (iter (car x))
                    (iter (cdr x))
                    1))))
    (iter x)))

(define x (list 'a 'b))
(define z1 (cons x x))
(define z2 (cons (list 'a 'b) (list 'a 'b)))
(format #t
        "count-pairs: x -> ~a, z1 -> ~a, z2 -> ~a"
        (count-pairs x)
        (count-pairs z1)
        (count-pairs z2))

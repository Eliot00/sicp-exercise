(define (fast-expt b n)
  (define (loop a b n)
    (cond ((= n 0) a)
          ((even? n) (loop a (* b b) (/ n 2)))
          (else (loop (* a b) (* b b) (/ (- n 1) 2)))))
  (loop 1 b n))

(display (fast-expt 4 2))
(newline)

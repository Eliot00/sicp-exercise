(define (even? n)
  (= (remainder n 2) 0))

(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (fast-mult a b)
  (define (loop a b result)
    (cond ((= b 0 ) result)
          ((even? b) (loop (double a) (halve b) result))
          (else (loop (double a) (halve (- b 1)) (+ result a)))))
  (loop a b 0))

(display (fast-mult 8 9))
(newline)

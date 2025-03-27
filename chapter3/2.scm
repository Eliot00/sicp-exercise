(define (make-monitored func)
  (define count 0)
  (define (dispatch m)
    (cond ((eq? 'how-many-calls? m) count)
          ((eq? 'reset-count m) (set! count 0))
          (else
            (set! count (+ count 1))
            (func m))))
  dispatch)

(define s (make-monitored sqrt))

(display (s 100))
(newline)
(display (s 'how-many-calls?))

(define (f-rec n)
  (if (< n 3)
    n
    (+ (f-rec (- n 1)) (* 2 (f-rec (- n 2))) (* 3 (f-rec (- n 3))))))

(define (f-iter n)
  (if (< n 3)
      n
      (let iter ((i 3)         ; 当前计算到第几个数
                 (a 2)         ; f(2)
                 (b 1)         ; f(1)
                 (c 0))        ; f(0)
        (if (= i n)
            (+ a (* 2 b) (* 3 c))
            (iter (+ i 1)
                  (+ a (* 2 b) (* 3 c))   ; 新的f(n)
                  a                       ; 新的f(n-1)
                  b)))))                  ; 新的f(n-2)


(display (f-rec 8))
(newline)

(display (f-iter 8))
(newline)

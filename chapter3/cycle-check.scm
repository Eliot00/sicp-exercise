;; exercise 3.18
(define (simple-cycle? lst)
  (define (iter lst seen)
    (cond
      [(null? lst) #f]
      [(memq lst seen) #t]
      [else (iter (cdr lst) (cons lst seen))]))
  (iter lst '()))

;; exercise 3.19
(define (floyd-cycle? lst)
  (define (iter t h)
    (and (pair? h)
         (pair? (cdr h))
         (or (eq? t h)
             (iter (cdr t) (cddr h)))))
  (and (pair? lst)
       (iter lst (cdr lst))))

(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define a (list 1 2))
(format #t "cycle?: ~a\n" (floyd-cycle? a))

(define b (make-cycle a))
(format #t "cycle?: ~a" (floyd-cycle? b))

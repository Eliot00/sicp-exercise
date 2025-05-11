#!/usr/bin/env -S guile -L . -s
!#

(use-modules (helper rand))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (estimate-integral pred x1 x2 y1 y2 trials)
  (let ((test (lambda ()
                (pred (random-in-range x1 x2)
                      (random-in-range y1 y2)))))
    (* (monte-carlo trials test)
       (- x2 x1)
       (- y2 y1))))

(define (square x) (* x x))

(define (estimate-pi trials)
  (let ((pred (lambda (x y)
                (<= (+ (square x) (square y)) 1))))
    (estimate-integral pred -1.0 1.0 -1.0 1.0 trials)))

(display (estimate-pi 100000))

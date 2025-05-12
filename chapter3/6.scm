#!/usr/bin/env -S guile -L . -s
!#

(use-modules (helper rand))

(define rand
  (let ((x random-init))
    (lambda (command)
      (cond
        ((eq? command 'generate)
         (set! x (rand-update x))
         x)
        ((eq? command 'reset)
         (lambda (new-x)
           (set! x new-x)))
        (else (error 'rand "command not recognized" command))))))

(display "generate: ")
(display (rand 'generate))
(newline)

(display "generate: ")
(display (rand 'generate))
(newline)

((rand 'reset) 100)
(display "reset: ")
(display (rand 'generate))
(newline)

(display "generate: ")
(display (rand 'generate))
(newline)

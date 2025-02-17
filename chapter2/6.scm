(define zero (lambda (f) (lambda (x) x)))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))

; Helper function to convert Church numerals to regular numbers
(define (church->number cn)
  ((cn (lambda (n) (+ n 1))) 0))

; Test functions
(define (test-church-numeral cn expected-value)
  (let ((result (church->number cn)))
    (if (= result expected-value)
        (display (string-append "✓ Test passed: " (number->string expected-value) "\n"))
        (display (string-append "✗ Test failed: Expected " (number->string expected-value)
                              " but got " (number->string result) "\n")))))

; Run tests
(display "Testing basic Church numerals:\n")
(test-church-numeral zero 0)
(test-church-numeral one 1)
(test-church-numeral two 2)

(display "\nTesting addition:\n")
(test-church-numeral (add zero zero) 0)
(test-church-numeral (add zero one) 1)
(test-church-numeral (add one one) 2)
(test-church-numeral (add one two) 3)
(test-church-numeral (add two two) 4)

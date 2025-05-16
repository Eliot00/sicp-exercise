(define (make-queue)
  (let ([front-ptr '()]
        [rear-ptr '()])
    (define (set-front-ptr! v) (set! front-ptr v))
    (define (set-rear-ptr! v) (set! rear-ptr v))
    (define (insert-queue! v)
      (let ([new-pair (cons v '())])
        (cond [(null? front-ptr)
               (set! front-ptr new-pair)
               (set! rear-ptr new-pair)]
              [else
               (set-cdr! rear-ptr new-pair)
               (set! rear-ptr new-pair)])))
    (define (delete-queue!)
      (if (null? front-ptr)
          (error "DELETE! called with an empty queue")
          (set! front-ptr (cdr front-ptr))))
    (define (dispatch m)
      (cond [(eq? m 'front-ptr) front-ptr]
            [(eq? m 'rear-ptr) rear-ptr]
            [(eq? m 'set-front-ptr!) set-front-ptr!]
            [(eq? m 'set-rear-ptr!) set-rear-ptr!]
            [(eq? m 'empty-queue?) (null? front-ptr)]
            [(eq? m 'front-queue)
             (if (null? front-ptr)
                 (error "FRONT called with an empty queue")
                 (car front-ptr))]
            [(eq? m 'insert-queue!) insert-queue!]
            [(eq? m 'delete-queue!) delete-queue!]
            [else (error "Unknown operation " m)]))
    dispatch))

(define (front-ptr queue)
  (queue 'front-ptr))

(define (rear-ptr queue)
  (queue 'rear-ptr))

(define (set-front-ptr! queue v)
  ((queue 'set-front-ptr!) v))

(define (set-rear-ptr! queue v)
  ((queue 'set-rear-ptr!) v))

(define (empty-queue? queue)
  (queue 'empty-queue?))

(define (front-queue queue)
  (queue 'front-queue))

(define (insert-queue! queue v)
  ((queue 'insert-queue!) v)
  queue)

(define (delete-queue! queue)
  ((queue 'delete-queue!)))

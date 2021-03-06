#lang racket/base

(require redex/benchmark
         "util.rkt"
         redex/reduction-semantics)
(provide (all-defined-out))

(define the-error "the tail reduction returns the wrong value")

(define-rewrite bug5
  (in-hole E v_2)
  ==>
  (in-hole E v_1)
  #:context (reduction-relation)
  #:once-only)

(include/rewrite (lib "redex/examples/stlc+lists.rkt") stlc bug5)

(include/rewrite "generators.rkt" generators bug-mod-rw)

(define small-counter-example  
  (term (tl ((cons 0) nil))))

(test small-counter-example)

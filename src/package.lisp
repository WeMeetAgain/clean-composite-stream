(cl:in-package #:cl-user)

(defpackage #:clean-composite-stream
  (:use #:cl #:trivial-gray-streams)
  (:export #:clean-composite-stream
           #:clean-composite-stream-stream
           #:clean-composite-stream-constituent-streams
           #:make-clean-concatenated-stream))

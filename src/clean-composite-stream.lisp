(cl:in-package #:clean-composite-stream)

(defgeneric clean-composite-stream-stream (stream))

(defgeneric clean-composite-stream-constituent-streams (stream))

(defclass clean-composite-stream (fundamental-stream)
  ((%composite-stream
    :initarg :composite-stream
    :accessor clean-composite-stream-stream)
   (%constituent-streams
    :initarg :constituent-streams
    :accessor clean-composite-stream-constituent-streams)))

;;; pass through stream methods to underlying composite stream

(defmethod stream-read-sequence ((stream clean-composite-stream) sequence start end &rest rest)
  (read-sequence sequence (clean-composite-stream-stream stream) :start start :end end))

(defmethod stream-read-byte ((stream clean-composite-stream))
  (read-byte (clean-composite-stream-stream stream) nil :eof))

;;; close *all* streams when the composite-stream is closed

(defmethod close ((stream clean-composite-stream) &key abort)
  (mapc (lambda (constituent-stream)
      (close constituent-stream :abort abort))
    (clean-composite-stream-constituent-streams stream))
  (close (clean-composite-stream-stream stream) :abort abort))

;;; clean versions of built-in composite streams

(defun make-clean-concatenated-stream (&rest streams)
  (make-instance 'clean-composite-stream
                 :composite-stream (apply #'make-concatenated-stream streams)
                 :constituent-streams streams))

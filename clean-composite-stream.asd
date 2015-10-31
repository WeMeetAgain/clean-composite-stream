(cl:in-package #:asdf-user)

(defsystem :clean-composite-stream
  :version "0.1.0"
  :description "Constituent-closing composite streams"
  :author "Cayman Nava"
  :license "MIT"
  :depends-on (:trivial-gray-streams)
  :components ((:module "src"
        :serial t
		:components
		((:file "package")
		 (:file "clean-composite-stream"))))
  :long-description #.(uiop:read-file-string
		       (uiop:subpathname *load-pathname* "README.md"))
  :in-order-to ((test-op (test-op clean-composite-stream-test))))

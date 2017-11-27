;;;; st-elonsim.asd

(asdf:defsystem #:st-elonsim
  :description "TODO Describe st-elonsim here"
  :author "Jacek \"TeMPOraL\" Złydach <temporal.pl@gmail.com>"
  :license "MIT"
  :depends-on (#:clack
               #:lass)
  :serial t
  :components ((:file "package")
               (:file "main")))


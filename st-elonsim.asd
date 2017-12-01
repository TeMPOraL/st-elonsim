;;;; st-elonsim.asd

(asdf:defsystem #:st-elonsim
  :description "TODO Describe st-elonsim here"
  :author "Jacek \"TeMPOraL\" Złydach <temporal.pl@gmail.com>"
  :license "MIT"
  :depends-on (#:hunchentoot
               #:clack
               #:spinneret
               #:lass
               #:parenscript)
  :serial t
  :components ((:file "package")

               (:module "game"
                        :components ((:file "core")
                                     (:file "interface")))

               (:file "main")))


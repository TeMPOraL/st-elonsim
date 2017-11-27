;;;; main.lisp

(in-package #:st-elonsim)



(defparameter *server* "Server instance.")



(defun main-handler (env)
  `(200 nil (,(with-output-to-string (str)
                (princ "<pre>" str)
                (prin1 env str)
                (princ "</pre>" str)))))



(defun start (&key (port 5000))
  (when *server*
    (stop))
  (setf *server* (clack:clackup (lambda (env) (funcall 'main-handler env)) :port port)))

(defun stop ()
  (clack:stop *server*)
  (setf *server* nil))

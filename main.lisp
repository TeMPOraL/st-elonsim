;;;; main.lisp

(in-package #:st-elonsim)



(defparameter *server* nil "Server instance.")



(defun main-handler (env)
  ;; TODO better routing
  (let ((path (getf env :path-info)))
    (cond
      ;; index
      ((or (string= path "/")
           (string= path "/index.html"))
       `(200
         (:content-type "text/html; charset=utf-8")
         (,(generate-game-html))))

      ;; CSS
      ((string= path "/interface.css")
       `(200
         (:content-type "text/css")
         (,(generate-interface-css))))

      ;; main JS
      ((string= path "/core.js")
       `(200
         (:content-type "application/javascript")
         (,(generate-core-js))))

      ;; catch-all
      (t
       `(404
         (:content-type "text/plain")
         ("Go away."))))))



(defun start (&key (port 5000))
  (when *server*
    (stop))
  (setf *server* (clack:clackup (lambda (env) (funcall 'main-handler env)) :port port)))

(defun stop ()
  (clack:stop *server*)
  (setf *server* nil))

(in-package #:st-elonsim)

;;; TODO HTML interface

(defun generate-game-html ()
  (spinneret:with-html-string
    (:doctype "html")
    (:html
     (:head
      (:link :rel "stylesheet" :href "interface.css")
      (:title "Elon Sim"))
     (:body

      ;; Top bar - global goal tracking
      (:div :id "topbar"
            (:div :id "topbar-people-in-space"
                  "People living in space - currently: "
                  (:span :id "val-people-in-space-current" "?")
                  ", record: "
                  (:span :id "val-people-in-space-top" "?"))
            (:div :id "topbar-max-distance-achieved"
                  "Maximum distance from Earth achieved by a living human - currently: "
                  (:span :id "val-max-distance-current" "?")
                  ", record: "
                  (:span :id "val-max-distance-top" "?"))
            (:div :id "time-toolbar"
                  (:div :id "current-time-box"
                        (:span :id "val-current-time" "2017-11-29 20:00:00 UTC"))
                  (:div :id "timewarp-buttons"
                        "[||] [>] [>>] [>>>] [>>>>]")))

      (:div :id "stuffz"
            "TODO")

      ;; Script
      (:script :type "text/javascript" :src "core.js")
      ))))

;;; TODO CSS styling

(defun generate-interface-css ()
  (let ((forms `((body
                  :background-color black
                  :color white))))
   (lass:write-sheet
    (apply #'lass:compile-sheet forms))))

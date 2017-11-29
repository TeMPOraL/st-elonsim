(in-package #:st-elonsim)

;;; TODO core JS driving the game

;;; TODO figure out if there's a nice way to insert comments into PS output.

(defun generate-core-js ()
  (ps

    ;; globally useful utilities
    (var *debug* t)

    (defmacro debug-log (&rest what)
      `(when *debug*
         (console.log ,@what)))

    ;; state

    (var *current-time* (new (-Date (chain -Date (-U-T-C 2018 0 1 0 0 0))))) ;NOTE starting date
    (var *seconds-per-tick* 1)

    (var *humans-in-space-current* 0)
    (var *humans-in-space-top* 13)      ;FIXME I think that's the record
    (var *human-distance-in-space-current* 0) ;FIXME determine
    (var *human-distance-in-space-top* 0)  ;FIXME determine

    (var *money* 1e9)                     ;starting money FIXME some sane amount

    ;; TODO save to local storage
    (defun save-game ()
      ;; TODO
      )

    ;; TODO load from local storage
    (defun load-game ()
      ;; TODO
      )

    ;; Utilities
    (defun format-date (date)
      (flet ((pad (what)
               (chain (+ "0" what) (slice -2))))
        (debug-log date)
        (+ (chain date (get-u-t-c-full-year))
           "-"
           (pad (1+ (chain date (get-u-t-c-month))))
           "-"
           (pad (chain date (get-u-t-c-date)))
           " "
           (pad (chain date (get-u-t-c-hours)))
           ":"
           (pad (chain date (get-u-t-c-minutes)))
           ":"
           (pad (chain date (get-u-t-c-seconds)))
           " UTC")))

    ;; Main world update function
    (defun tick ()
      (debug-log "Tick." *seconds-per-tick*)

      ;; update and redisplay time
      (chain *current-time* (set-u-t-c-seconds (+ (chain *current-time* (get-u-t-c-seconds))
                                                  *seconds-per-tick*)))
      (setf (chain document (get-element-by-id "val-current-time") inner-h-t-m-l)
            (format-date *current-time*)))

    ;; Get the main game loop running.

    (chain window (set-interval #'tick 1000))
    ))

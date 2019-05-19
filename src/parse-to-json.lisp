(in-package :cl-user)
(defpackage parse-to-json
  (:nicknames :ptj)
  (:use :cl :cl-json)
  ;; XXX We don't actually need to export anything, right?
  (:export #:parse-n-print
           :parse-path-to-json))

(in-package :parse-to-json)

(defun parse-path-to-json (path)
  (with-open-file (stream path)
    (parse-stream-to-json stream)))

(defun loop-stream (stream)
  (loop for line = (read stream nil)
     while line
     collect line))

(defun parse-stream-to-json (stream)
  (let ((sexps (loop-stream stream)))
    (with-output-to-string (s)
      (encode-json sexps s))))

(defun parse-n-print (path)
  (princ (parse-path-to-json path)))

(defun parse-stream-n-print (stream)
  (princ (parse-stream-to-json stream)))

(setf *lisp-identifier-name-to-json* #'identity)

#+ecl (defun main-0 ()
        (let ((ext:*lisp-init-file-list* nil))
          (let ((path (cadr (ext:command-args))))
            (parse-n-print path)))
        (ext:quit 0))

(defun main ()
  (parse-stream-n-print *standard-input*))

#+ecl (main)

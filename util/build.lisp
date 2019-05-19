;; (asdf:make-build :parse-to-json
;;                  :type :program
;;                  :move-here #P"./"
;;                  :prologue-code (progn (require 'asdf)
;;                                        ; (load "deps/bundle.lisp")
;;                                        (find-package "cl-json")))

(asdf:make-build :parse-to-json
                 :type :program
                 :move-here #P"./"
                 :prologue-code (progn (require 'asdf)
                                       (load "deps/bundle.lisp")))


;; (asdf:make-build :parse-to-json
;;                  :type :program
;;                  :move-here #P"./")

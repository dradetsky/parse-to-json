(defsystem "parse-to-json"
    :description "read some lisp, print some json"
    :version "0.0.0"
    :author "dmr"
    :license "WTFPL"
    :depends-on ("cl-json")
    :serial t
    :components ((:module "src"
                          :components ((:file "parse-to-json")))))



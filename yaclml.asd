;; -*- lisp -*-

(defpackage :it.bese.yaclml.system
  (:use :common-lisp :asdf))

(in-package :it.bese.yaclml.system)

(defsystem :yaclml
    :components ((:static-file "yaclml.asd")
                 (:module :src
                  :components ((:file "packages")
			       (:file "yaclml" :depends-on ("packages" "attribute-bind"))
			       (:file "attribute-bind" :depends-on ("packages"))
			       (:file "bracket-reader" :depends-on ("packages" :tags))
			       (:module :tags
                                :serial t
				:components ((:file "html4")
					     (:file "standard-yaclml")
					     (:file "html+"))
				:depends-on ("yaclml"))
                               (:module :tal
				:components ((:file "xmls")
                                             (:file "compile" :depends-on ("xmls" "tal-environment"))
					     (:file "generator" :depends-on ("compile"))
					     (:file "handlers" :depends-on ("compile"))
                                             (:file "tal-environment"))
                                :depends-on ("yaclml" :tags)))))
    :properties ((:features "v0.5.2" "v0.5.1" "v0.5.0"))
    :depends-on (:arnesi :iterate))

(defsystem :yaclml.test
  :components ((:module :t
			:components ((:file "packages")
				     (:file "tal" :depends-on ("packages")))))
  :depends-on (:yaclml :FiveAM))

;;;; * Introduction

;;;; YACLML is a library for creating HTML in lisp.

;;;;@include "src/packages.lisp"

;;;;@include "src/yaclml.lisp"

;;;;@include "src/attribute-bind.lisp"

;;;;@include "src/bracket-reader.lisp"

;;;;@include "src/tags/html4.lisp"

;;;;@include "src/tags/html+.lisp"

;;;;@include "src/tags/standard-yaclml.lisp"

;;;;@include "src/tal/compile.lisp"

;;;;@include "src/tal/handlers.lisp"

;;;;@include "src/tal/tal-environment.lisp"

;;;;@include "src/tal/generator.lisp"

;;;;@include "src/tal/xmls.lisp"

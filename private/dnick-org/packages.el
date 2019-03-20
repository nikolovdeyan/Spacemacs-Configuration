;;; packages.el --- dnick-org layer packages file for Spacemacs.
;;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;; License: GPLv3
;;; Code:

(defconst dnick-org-packages
	'(org))

(defvar dnick-org-pages-theme-dir ;; Currently not used
  (concat (file-name-directory load-file-name) "org-page-themes"))

(defun dnick-org/setup-org ()
  (setq
;;   org-modules
;;   '(org-bibtex)
   org-directory "~/Dropbox/org/"
   org-default-notes-file "~/Dropbox/org/notes.org"
;;--------------------------------------------------------------------------------------------
;;      ### VISUALS ###
;;--------------------------------------------------------------------------------------------
   org-bullets-bullet-list '("※" "✿" "○" "•")
   org-priority-faces '(
                        (65 :foreground "red")
                        (66 :foreground "yellow")
                        (67 :foreground "blue"))
   org-ellipsis " ▼"
   org-hide-emphasis-markers t   ;; hides the markup elements symbols
   org-pretty-entities t         ;; use named entities like \alpha
   org-use-sub-superscripts nil
   org-indent-mode t             ;; new lines indented to outline level
   org-startup-indented t
   org-html-inline-images t      ;; export images instead of links to them
;;--------------------------------------------------------------------------------------------
;;      ### TODO ###
;;--------------------------------------------------------------------------------------------
   org-todo-keywords '(
                       (sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
                       (sequence "WAIT(w)" "HOLD(h)" "|" "CANCELLED(c)" "ACTV(a)"))

   org-todo-keyword-faces '(
                            ("TODO" :foreground "OrangeRed" :weight bold)
                            ("NEXT" :foreground "DeepSkyBlue" :weight bold)
                            ("DONE" :foreground "SpringGreen" :weight bold)
                            ("WAIT" :foreground "Orange" :weight bold)
                            ("HOLD" :foreground "HotPink" :weight bold)
                            ("CANCELLED" :foreground "DarkGray" :weight bold)
                            ("ACTV" :foreground "turquoise" :weight bold))

;;--------------------------------------------------------------------------------------------
;;      ### CAPTURE ###
;;--------------------------------------------------------------------------------------------
   org-capture-templates '(
                           ("t" "Todo [inbox]" entry (file+headline "~/Dropbox/ORG/inbox.org" "Tasks")
                            "* TODO %i%?")
                           ("T" "Tickler" entry (file+headline "~/Dropbox/ORG/tickler.org" "Tickler")
                            "* %i%? \n %U"))

;;--------------------------------------------------------------------------------------------
;;      ### BABEL ###
;;--------------------------------------------------------------------------------------------
		;; org-ditaa-jar-path "~/ditaa/ditaa0_9.jar"
        org-confirm-babel-evaluate t
        org-src-window-setup 'current-window
		    org-plantuml-jar-path
         (expand-file-name "~/scripts/plantuml.jar")
        ;;org-babel-default-header-args '((:session . "none")
        ;;                                (:results . "replace")
        ;;                                (:exports . "code")
        ;;                                (:cache . "no")
        ;;                                (:noweb . "no")
        ;;                                (:hlines . "no")
        ;;                                (:tangle . "no"))

        org-babel-default-header-args:python '((:results . "output verbatim raw replace")
                                               (:exports . "both")
                                               (:wrap . "EXAMPLE"))

        org-babel-default-header-args:sh '((:results . "output verbatim raw replace")
                                           (:exports . "both")
                                           (:wrap . "EXAMPLE"))
;;--------------------------------------------------------------------------------------------
;;      ### EXPORT ###
;;--------------------------------------------------------------------------------------------
        org-export-babel-evaluate nil
        org-export-with-sub-superscripts t
        org-html-htmlize-output-type 'css
        org-export-with-LaTeX-fragments t
        org-export-with-tags nil
        org-latex-listings t
        org-html-xml-declaration
        '(("html" . "")
          ("was-html" . "<?xml version=\"1.0\" encoding=\"%s\"?>")
          ("php" . "<?php echo \"<?xml version=\\\"1.0\\\" encoding=\\\"%s\\\" ?>\"; ?>"))


;;--------------------------------------------------------------------------------------------
;;      ### REFILE ###
;;--------------------------------------------------------------------------------------------
   org-refile-targets '(
                        ("active.org" :maxlevel . 1)
                        ("future.org" :maxlevel . 3)
                        ("tickler.org" :maxlevel . 2)
                        ("past.org" :maxlevel . 2))
   org-refile-use-outline-path 'file
   org-outline-path-complete-in-steps 'nil
   org-agenda-files '(
                      "~/Dropbox/ORG/inbox.org"
                      "~/Dropbox/ORG/active.org"
                      "~/Dropbox/ORG/tickler.org")
   )
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (dot . t)
     (python . t)
     (org . t)
     (plantuml . t)
     (latex . t)
     (sql . t)))
  (add-to-list 'org-src-lang-modes '("plantuml" . fundamental))
)

(defun dnick-org/init-org ()
  (use-package org
    :defer t
    :init
    (spacemacs/declare-prefix "oo" "org" "org-mode")
    (spacemacs/declare-prefix "ooa" "agenda" "org-agenda")
    (spacemacs/declare-prefix "ooc" "capture" "org-capture")
    (spacemacs/declare-prefix "ooe" "export dispatcher" "org-export-dispatch")
    (spacemacs/declare-prefix "oor" "refile" "org-refile")
    (spacemacs/declare-prefix "oot" "ToC" "Table of Contents")
    (progn
	    (spacemacs/set-leader-keys "ooa" 'org-agenda)
      (spacemacs/set-leader-keys "ooc" 'org-capture)
      (spacemacs/set-leader-keys "ooe" 'org-export-dispatch)
      (spacemacs/set-leader-keys "oor" 'org-refile)
      (spacemacs/set-leader-keys "ooC" 'calendar)
      (spacemacs/set-leader-keys "oot" 'org-toc-show)
      )
    :config
    (progn
        (dnick-org/setup-org)
        )
    )
 )
;;; packages.el ends here

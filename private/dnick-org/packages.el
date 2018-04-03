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
   org-pretty-entities t
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

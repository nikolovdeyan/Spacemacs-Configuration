;;; packages.el --- dnick-org layer packages file for Spacemacs.
;;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;; License: GPLv3
;;; Code:

(defconst dnick-org-packages
	'(org))

(defun dnick-org/setup-org ()
  (setq
;;   org-modules
;;   '(org-bibtex)
   org-directory "~/Dropbox/org/"
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
   org-startup-indented t        ;; align text to heading
   org-html-inline-images t      ;; export images instead of links to them
   org-tags-column 80
;;--------------------------------------------------------------------------------------------
;;      ### TODO ###
;;--------------------------------------------------------------------------------------------
   org-log-into-drawer t  ;; SCHEDULED, CLOSED, DEADLINE will still be placed outside the drawer
   ;; org-log-done t  ;; places the CLOSED timestamp outside the drawer
   org-todo-keywords '(
                       (sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)" "CANCELLED(c@)")
                       (sequence "WAIT(w)" "HOLD(h)" "|" "ACTV(a!)")
                       (sequence "MEET(m)" "|" "MET(t)")
                       )

   org-todo-keyword-faces '(
                            ("TODO" :foreground "OrangeRed" :weight bold)
                            ("NEXT" :foreground "DeepSkyBlue" :weight bold)
                            ("DONE" :foreground "SpringGreen" :weight bold)
                            ("WAIT" :foreground "Orange" :weight bold)
                            ("HOLD" :foreground "HotPink" :weight bold)
                            ("CANCELLED" :foreground "DarkGray" :weight bold)
                            ("ACTV" :foreground "turquoise" :weight bold)
                            ("MEET" :foreground "OrangeRed" :weight bold)
                            ("MET" :foreground "SpringGreen" :weight bold)
                            )
;;--------------------------------------------------------------------------------------------
;;      ### CAPTURE ###
;;--------------------------------------------------------------------------------------------
   org-default-notes-file (concat org-directory "inbox.org")  ;; set default capture target
   org-capture-templates '(
                           ("n" "Note" entry (file+headline org-default-notes-file "Tasks")
                            "* TODO %^{Description:} \n:LOGBOOK:\n- CREATED: %U\n:END:\n%?")
                           ("t" "Task" entry (file+headline org-default-notes-file "Tasks")
                            "* TODO %^{Description:} \n:LOGBOOK:\n- CREATED: %U\n:END:\n%?")
                           ("m" "Meeting (quick)" entry (file+headline org-default-notes-file "Tasks")
                            "* MET %^{Meeting with:} \n%?" :clock-in t)

                           )
;;--------------------------------------------------------------------------------------------
;;      ### REFILE ###
;;--------------------------------------------------------------------------------------------
   org-refile-targets '(
                        (org-agenda-files . (:maxlevel . 2))
                        ("future.org" :maxlevel . 1)
                        ("archive_home.org" :maxlevel . 1)
                        ("archive_work.org" :maxlevel . 1)
                        )
   org-refile-use-outline-path 'file  ;; include the destination file as a path element
   org-outline-path-complete-in-steps nil

;;--------------------------------------------------------------------------------------------
;;      ### AGENDA ###
;;--------------------------------------------------------------------------------------------
   ;; org-agenda-files (list org-directory)
   org-agenda-files '(
                      "~/Dropbox/org/inbox.org"
                      "~/Dropbox/org/work.org"
                      "~/Dropbox/org/home.org")
   ;; Ignore tasks with schedule or deadline in task list view
   org-agenda-todo-ignore-with-date t
   org-agenda-start-on-weekday nil  ;; starting on Sunday?
   org-agenda-start-day "+0d"       ;; starting day for agenda view
   org-agenda-span 1                ;; number of days shown in default agenda view
   org-agenda-custom-commands '(
                                ("c" "Simple agenda view" ((agenda "") (alltodo "")))
                                )
;;--------------------------------------------------------------------------------------------
;;      ### BABEL ###
;;--------------------------------------------------------------------------------------------
   org-confirm-babel-evaluate t
   org-src-window-setup 'current-window
   org-ditaa-jar-path "~/ditaa/ditaa0_9.jar"
	 org-plantuml-jar-path
   (expand-file-name "~/plantuml/plantuml.jar")

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

   )

  ;; save all org buffers after refiling a task
  (advice-add 'org-refile :after 'org-save-all-org-buffers)

  (org-babel-do-load-languages
   'org-babel-load-languages '(
     (emacs-lisp . t)
     (dot . t)
     (python . t)
     (org . t)
     (plantuml . t)
     (ditaa . t)
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
    (spacemacs/declare-prefix "oob" "babel execute" "org-babel-execute-src-block")
    (spacemacs/declare-prefix "ooi" "toggle inline images" "org-toggle-inline-images")
    (progn
	    (spacemacs/set-leader-keys "ooa" 'org-agenda)
      (spacemacs/set-leader-keys "ooc" 'org-capture)
      (spacemacs/set-leader-keys "ooe" 'org-export-dispatch)
      (spacemacs/set-leader-keys "oor" 'org-refile)
      (spacemacs/set-leader-keys "ooC" 'calendar)
      (spacemacs/set-leader-keys "oob" 'org-babel-execute-src-block)
      (spacemacs/set-leader-keys "ooi" 'org-toggle-inline-images)
      )
    :config
    (progn
        (dnick-org/setup-org)
        )
    )
 )
;;; packages.el ends here

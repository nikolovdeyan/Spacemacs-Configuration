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
		org-modules
        '(org-bibtex)
		org-directory "~/Dropbox/ORG/"
		org-default-notes-file "~/Dropbox/ORG/notes.org"
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
		;; org-pretty-entities t
		org-indent-mode t             ;; new lines indented to outline level
		org-startup-indented t
		org-html-inline-images t      ;; export images instead of links to them
;;--------------------------------------------------------------------------------------------
;;      ### TODO ### 
;;--------------------------------------------------------------------------------------------
		org-todo-keywords '(
		 (sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
		 (sequence "WAIT(w)" "HOLD(h)" "|" "CANCELLED(c)" "MEETING"))
		
		org-todo-keyword-faces '(
		 ("TODO" :foreground "OrangeRed" :weight bold)
		 ("NEXT" :foreground "DeepSkyBlue" :weight bold)
		 ("DONE" :foreground "SpringGreen" :weight bold)
		 ("WAIT" :foreground "Orange" :weight bold)
		 ("HOLD" :foreground "HotPink" :weight bold)
		 ("CANCELLED" :foreground "DarkGray" :weight bold)
		 ("MEETING" :foreground "MediumSeaGreen" :weight bold))
		
		;; RESEARCH Usage
		;; org-use-fast-todo-selection t 
		;; org-treat-S-cursor-todo-selection-as-state-change nil
        ;; org-enforce-todo-dependencies t
		
		org-todo-state-tags-triggers '(  ;; Changing state of task triggers tag update.
		 ("CANCELLED" ("CANCELLED" . t))
         ("WAITING" ("WAITING" . t))
         ("HOLD" ("WAITING") ("HOLD" . t))
         (done ("WAITING") ("HOLD"))
         ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
         ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
         ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))		 
;;--------------------------------------------------------------------------------------------
;;      ### TAGS ###
;;--------------------------------------------------------------------------------------------	
		org-tag-alist '(
		 ("WAITING" . ?w)
		 ("HOLD" . ?h)
         ("PERSONAL" . ?P)
         ("WORK" . ?W)
         ("NOTE" . ?n)
         ("RECIPE" . ?r)
         ("NOTES" . ?n)
         ("REFERENCE" . ?R)
         ("WORK INSTRUCTION" . ?i)
		 )
		org-fast-tag-selection-single-key nil ;; Don't exit after first keystroke
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
;;--------------------------------------------------------------------------------------------
;;      ### AGENDA ###
;;--------------------------------------------------------------------------------------------	
		org-agenda-dim-blocked-tasks nil
		org-agenda-compact-blocks t
		org-agenda-tags-todo-honor-ignore-options t
		org-agenda-custom-commands '(
		 ("o" "At the office" tags-todo "@office"
		  ((org-agenda-overriding-header "Office")
           (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first))))   
        org-agenda-todo-ignore-with-date nil
        org-agenda-todo-ignore-deadlines nil
        org-agenda-todo-ignore-scheduled nil
        org-agenda-todo-ignore-timestamp nil
        org-agenda-skip-deadline-if-done t
		org-agenda-skip-timestamp-if-done t
        org-agenda-skip-scheduled-if-done t
		org-agenda-start-on-weekday 1
        org-agenda-time-grid '(
		 (daily today remove-match)
         #("----------------" 0 16 (org-heading t))
         (0900 1100 1300 1500 1700))
		org-agenda-tags-column -90	
		org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM"		
;;--------------------------------------------------------------------------------------------
;;      ### BABEL ###
;;--------------------------------------------------------------------------------------------
		org-ditaa-jar-path "~/ditaa/ditaa0_9.jar"
		;; org-plantuml-jar-path "~/plantuml/plantuml.jar"
        org-confirm-babel-evaluate t
        org-src-window-setup 'current-window
		org-plantuml-jar-path
         (expand-file-name "~/plantuml/plantuml.jar")
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
		;; org-html-head (storax/org-rtd-template-html-header)
   )

   (org-babel-do-load-languages
       'org-babel-load-languages
       '((emacs-lisp . t)
         (dot . t)
         (ditaa . t)
         (python . t)
         (ruby . t)
         (gnuplot . t)
         (clojure . t)
         (sh . t)
         (org . t)
         (plantuml . t)
         (latex . t)
      (sql . t)))
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

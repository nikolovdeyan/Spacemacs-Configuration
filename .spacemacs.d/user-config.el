;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/user-config ()
 (setq powerline-default-separator 'arrow)
 (global-set-key (kbd "C-+") 'text-scale-increase)
 (global-set-key (kbd "C--") 'text-scale-decrease)
 (global-set-key (kbd "C-)") 'text-scale-adjust)
 (spacemacs/set-leader-keys "oi" 'helm-semantic-or-imenu)
 (use-package expand-region
              :ensure t
              :bind
                (("C-@" . er/expand-region)
                 ("C-=" . er/expand-region)
                 ("M-3" . er/expand-region)))
 (use-package all-the-icons)
 (use-package spaceline-all-the-icons
              :after spaceline
              :init
                (setq spaceline-all-the-icons-slim-render nil
                 spaceline-all-the-icons-primary-separator ""
                 spaceline-all-the-icons-secondary-separator ""
                 spaceline-all-the-icons-separator-type 'arrow
                 spaceline-all-the-icons-flycheck-alternate t
                 spaceline-all-the-icons-hide-long-buffer-path t
                 spaceline-all-the-icons-highlight-file-name nil
                 spaceline-all-the-icons-icon-set-git-ahead (quote commit))
              :config
                (spaceline-toggle-all-the-icons-buffer-size-off)
                (spaceline-all-the-icons-theme))

 (use-package js2-mode
              :config
                (setq js2-basic-offset 2
                      js-indent-level 2
                      js-level-indent 2
                      js2-idle-timer-delay 0.1
                      js2-strict-trailing-comma-warning nil
                      js2-include-node-externs t))
 (add-hook 'js2-mode-hook
   (lambda () (mapc (lambda (pair) (push pair prettify-symbols-alist))
     '(("=>" . (#x00A0 (Br . Bl) #xe13f))
       (">=" . (#x00A0 (Br . Bl) #xe145))
       ("<=" . (#x00A0 (Br . Bl) #xe141))))
     (setq prettify-symbols-unprettify-at-point t)
     (prettify-symbols-mode)))

 (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
 (add-hook 'js2-mode-hook 'highlight-operators-js)
 
 (add-hook 'python-mode-hook (lambda ()
                               (setq flycheck-checker 'python-pylint
                                     flycheck-checker-error-threshold 900
                                     flycheck-pylintrc "~/.pylintrc"
									 )))
 (add-hook 'org-mode-hook
   (lambda () (mapc (lambda (pair) (push pair prettify-symbols-alist))
     '(("#+BEGIN_SRC" . (#x00A0 (Br . Bl) #xE144))
       ("#+begin_src" . (#x00A0 (Br . Bl) #xE144))
       ("#+END_SRC" . (#x00A0 (Br . Bl) #xE148))
       ("#+end_src" . (#x00A0 (Br . Bl) #xE148))
       ("=>" . (#x00A0 (Br . Bl) #xe13f))
       ("<->" . (#x00A0 (Br . Bl) #x00A0 (Br . Bl) #xe154))
       ("->" . (#x00A0 (Br . Bl) #xe114))
       ("<-" . (#x00A0 (Br . Bl) #xe152))
       (">=" . (#x00A0 (Br . Bl) #xe145)) 
       ("<=" . (#x00A0 (Br . Bl) #xe141))))
       ;;  ("*" . (#xF176 (Br . Bl) #xF18A))
       ;;  ("**" . (#xF176 (Br . Bl) #xF176 (Br . Bl) #xF18A))
       ;;  ("***" . (#xF176 (Br . Bl) #xF176 (Br . Bl) #xF176 (Br . Bl) #xF18A))
       ;;  ("****" . (#xF176 (Br . Bl) #xF176 (Br . Bl) #xF176 (Br . Bl) #xF176 (Br . Bl) #xF18A))
       ;;  ("*****" . (#xF176 (Br . Bl) #xF176 (Br . Bl) #xF176 (Br . Bl) #xF176 (Br . Bl) #xF176 (Br . Bl) #xF18A))
       ;;  ("******" . (#xF176 (Br . Bl) #xF176 (Br . Bl) #xF176 (Br . Bl) #xF176 (Br . Bl) #xF176 (Br . Bl) #xF176 (Br . Bl) #xF18A))))
     (setq prettify-symbols-unprettify-at-point t)
     (prettify-symbols-mode)))

;;(set-fontset-font "fontset-default" '(#x27F0 . #x27FF) "Segoe UI Symbol")
 (set-fontset-font "fontset-default" #xe13f "Fira Code Symbol")
 (set-fontset-font "fontset-default" #xe114 "Fira Code Symbol")
 (set-fontset-font "fontset-default" #xe138 "Fira Code Symbol")
 (set-fontset-font "fontset-default" #xe141 "Fira Code Symbol")
 (set-fontset-font "fontset-default" #xe145 "Fira Code Symbol")
 (set-fontset-font "fontset-default" #xe152 "Fira Code Symbol")
 (set-fontset-font "fontset-default" #xe154 "Fira Code Symbol")
 (set-fontset-font "fontset-default" #xE144 "Segoe UI Symbol") ;; org mode code-block keyboard icon
;;(setq face-font-rescale-alist '(("Segoe UI Symbol" . 0.9)))
 (set-fontset-font "fontset-default" #xE148 "Segoe UI Symbol") 
 (set-fontset-font "fontset-default" #xF176 "fontcustom") ;; org mode bullets and forms for outline
 (set-fontset-font "fontset-default" #xF18A "fontcustom")
;; (set-fontset-font "fontset-default" '(#xF100 . #xF21A) "fontcustom")
;; (set-fontset-font "fontset-default" '(#xE30A . #xE30C) "Material Icons")
;; (set-fontset-font "fontset-default" '(#xe0a0 . #xe16f) "Fira Code Symbol")
;; (set-fontset-font "fontset-default" '(#xe903 . #xe939) "all-the-icons")

;; GTD
(setq org-agenda-files '("~/gtd/inbox.org"
                         "~/gtd/gtd.org"
                         "~/gtd/tickler.org"))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/gtd/inbox.org" "Tasks")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/gtd/tickler.org" "Tickler")
                               "* %i%? \n %U")))

(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps 'nil)
(setq org-refile-targets '(("gtd.org" :maxlevel . 1)
                           ("someday.org" :maxlevel . 3)
                           ("tickler.org" :maxlevel . 2)))

(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

(setq org-agenda-custom-commands
      '(("o" "At the office" tags-todo "@office"
         ((org-agenda-overriding-header "Office")
          (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))))

(defun my-org-agenda-skip-all-siblings-but-first ()
  "Skip all but the first non-done entry."
  (let (should-skip-entry)
    (unless (org-current-is-todo)
      (setq should-skip-entry t))
    (save-excursion
      (while (and (not should-skip-entry) (org-goto-sibling t))
        (when (org-current-is-todo)
          (setq should-skip-entry t))))
    (when should-skip-entry
      (or (outline-next-heading)
          (goto-char (point-max))))))

(defun org-current-is-todo ()
  (string= "TODO" (org-get-todo-state)))

)

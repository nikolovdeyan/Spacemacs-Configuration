;; -*- mode: emacs-lisp -*-
(defun dotspacemacs/layers ()
 (setq-default
  dotspacemacs-distribution 'spacemacs
  dotspacemacs-enable-lazy-installation 'unused
  dotspacemacs-ask-for-lazy-installation t
  dotspacemacs-configuration-layer-path '()
  dotspacemacs-configuration-layers '(
    csv
    helm
    dash
    (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
    (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-return-key-behavior nil
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-enable-sort-by-usage t)
    syntax-checking
    ;; spell-checking
    git
;;  ----- languages -----
    emacs-lisp
    html
    (python :variables python-test-runner 'pytest)
	ipython-notebook
    javascript
    typescript
    ;; sql
;;  ----- text processing -----
    markdown
    org
    pandoc
    latex
;;  ----- visuals -----
    ;; themes-megapack
  )

dotspacemacs-additional-packages '(
  simple-httpd
  rainbow-mode
  impatient-mode
  flymd
  all-the-icons
  all-the-icons-dired
  spaceline-all-the-icons
  vimish-fold
  evil-vimish-fold
)

dotspacemacs-frozen-packages '()

dotspacemacs-excluded-packages '()
 )
)
;; -*- mode: emacs-lisp -*-
(defun dotspacemacs/layers ()
 (setq-default
    dotspacemacs-distribution 'spacemacs
    dotspacemacs-enable-lazy-installation 'unused
    dotspacemacs-ask-for-lazy-installation t
    dotspacemacs-configuration-layer-path '("~/.spacemacs.d/private")
    dotspacemacs-configuration-layers '(
        csv
        helm
        dash
        shell
        (auto-completion
            :variables
                auto-completion-enable-help-tooltip t
                auto-completion-enable-snippets-in-popup t
                auto-completion-return-key-behavior nil
                auto-completion-tab-key-behavior 'complete
                auto-completion-enable-sort-by-usage t)
        syntax-checking
        (spell-checking
            :variables
                spell-checking-enable-by-default nil
                spell-checking-enable-auto-dictionary t
                enable-flyspell-auto-completion nil)
        git
;;      ----- languages -----
        emacs-lisp
        html
        python
        django
        ;; ipython-notebook
        javascript
        sql
;;      ----- text processing -----
        markdown
        org
        yaml
        bibtex
        latex
;;      ----- visuals -----
        ;; themes-megapack

;;      ----- custom layers -----
        dnick-python
        dnick-org
        dnick-javascript
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
  solarized-theme
)

dotspacemacs-frozen-packages '()

dotspacemacs-excluded-packages '()
 )
)

;; -*- mode: emacs-lisp -*-
(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/private")
   dotspacemacs-configuration-layers '(
                                       helm
                                       dash    ;; zeal
                                       shell
                                       (auto-completion
                                        :variables
                                        auto-completion-enable-snippets-in-popup nil
                                        auto-completion-enable-help-tooltip nil
                                        auto-completion-return-key-behavior nil
                                        auto-completion-complete-with-key-sequence-delay 0.1
                                        auto-completion-minimum-prefix-length 2
                                        auto-completion-idle-delay 0.5
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
                                       (python
                                        :variables
                                        python-pipenv-activate t
                                        ;; flycheck-checker 'python-pylint
                                        ;; flycheck-pylintrc ".pylintrc"
                                        ;; flycheck-checker-error-threshold 500
                                        python-backend 'lsp
                                        python-lsp-server 'pyls
                                        python-formatter 'black
                                        python-format-on-save t
                                        python-sort-imports-on-save t
                                        python-fill-column 99
                                        )
                                       (lsp
                                        :variables
                                        lsp-modeline-diagnostics-scope :file)
                                       emacs-lisp
                                       rust
                                       html    ;; web-mode
                                       javascript
                                       sql
                                       ansible
                                       ;;      ----- text processing -----
                                       latex
                                       ;;markdown
                                       dnick-org
                                       yaml
                                       csv
                                       plantuml
                                       ipython-notebook
                                       ;;      ----- visuals -----
                                       ;; themes-megapack
                                       )

   dotspacemacs-additional-packages '(
                                      simple-httpd
                                      rainbow-mode
                                      impatient-mode
                                      flymd
                                      yasnippet-snippets
                                      vimish-fold
                                      evil-vimish-fold
                                      doom-themes
                                      solarized-theme
                                      xresources-theme
                                      )

   dotspacemacs-frozen-packages '()

   dotspacemacs-excluded-packages '(lsp-python-ms)
   )
  )

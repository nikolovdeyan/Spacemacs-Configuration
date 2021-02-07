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
                                        auto-completion-enable-help-tooltip t
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
                                       (python
                                        :variables
                                        python-pipenv-activate t
                                        python-backend 'lsp
                                        python-lsp-server 'pyls
                                        python-formatter 'black
                                        python-format-on-save t
                                        python-sort-imports-on-save t
                                        python-fill-column 99
                                        ;; python-poetry-activate t
                                        )
                                       lsp
                                       emacs-lisp
                                       rust
                                       html    ;; web-mode
                                       javascript
                                       sql
                                       ansible
                                       ;;      ----- text processing -----
                                       latex
                                       markdown
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
                                      solarized-theme
                                      xresources-theme
                                      molokai-theme
                                      )

   dotspacemacs-frozen-packages '()

   dotspacemacs-excluded-packages '()
   )
  )

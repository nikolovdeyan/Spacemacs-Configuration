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
                                       html    ;; web-mode
                                       python
                                       dnick-python
                                       javascript
                                       dnick-javascript
                                       sql
                                       ;;      ----- text processing -----
                                       markdown
                                       dnick-org
                                       yaml
                                       csv
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
                                      molokai-theme
                                      )

   dotspacemacs-frozen-packages '()

   dotspacemacs-excluded-packages '()
   )
  )

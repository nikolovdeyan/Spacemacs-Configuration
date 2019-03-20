;; -*- mode: emacs-lisp -*-
(if (file-readable-p "~/.spacemacs.d/spacemacs-layers.el") (load "~/.spacemacs.d/spacemacs-layers.el"))
(if (file-readable-p "~/.spacemacs.d/spacemacs-init.el") (load "~/.spacemacs.d/spacemacs-init.el"))
(if (file-readable-p "~/.spacemacs.d/user-init.el") (load "~/.spacemacs.d/user-init.el"))
(if (file-readable-p "~/.spacemacs.d/user-config.el") (load "~/.spacemacs.d/user-config.el"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ein deferred websocket auctex-latexmk plantuml-mode company-auctex auctex org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download gnuplot zeal-at-point yasnippet-snippets yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit sql-indent spaceline solarized-theme smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs rainbow-mode rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode pcre2el paradox orgit org-bullets open-junk-file neotree multi-term move-text molokai-theme mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint json-mode js2-refactor js-doc indent-guide impatient-mode hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flyspell-correct-helm flymd flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-vimish-fold evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump diminish define-word cython-mode csv-mode company-web company-tern company-statistics company-quickhelp company-anaconda column-enforce-mode coffee-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(plantuml-jar-path "/home/deo/scripts/plantuml.jar")
 '(tls-checktrust nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

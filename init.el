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
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(evil-want-Y-yank-to-eol nil)
 '(explicit-shell-file-name "C:\\\\Program Files\\\\Git\\\\git-cmd.exe")
 '(org-bullets-face-name (quote Segoe\ UI\ Symbol))
 '(org-export-babel-evaluate nil)
 '(org-export-backends (quote (html latex)))
 '(org-export-use-babel nil)
 '(org-export-with-sub-superscripts nil)
 '(org-export-with-tags nil)
 '(package-selected-packages
   (quote
    (yaml-mode ht alert projectile packed avy anaconda-mode dash-functional tern iedit smartparens evil goto-chg flycheck yasnippet company helm helm-core htmlize markdown-mode magit magit-popup git-commit with-editor hydra haml-mode js2-mode simple-httpd spaceline powerline f s sql-indent org-plus-contrib pony-mode typescript-mode vimish-fold org-ref pdf-tools key-chord ivy tablist helm-bibtex parsebib biblio biblio-core org-category-capture flyspell-correct-helm flyspell-correct auto-dictionary all-the-icons memoize font-lock+ electric-operator names evil-unimpaired ein request-deferred websocket deferred zonokai-theme zenburn-theme zen-and-art-theme zeal-at-point yapfify xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toc-org tide tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline-all-the-icons spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme restart-emacs rainbow-mode rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el paradox pandoc-mode ox-pandoc orgit organic-green-theme org-projectile org-present org-pomodoro org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum livid-mode live-py-mode linum-relative link-hint light-soap-theme less-css-mode json-mode js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme inkpot-theme info+ indent-guide impatient-mode hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md gandalf-theme fuzzy flymd flycheck-pos-tip flx-ido flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-vimish-fold evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump dracula-theme django-theme define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme csv-mode company-web company-tern company-statistics company-quickhelp company-auctex company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile auctex-latexmk apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme all-the-icons-dired alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(python-shell-interpreter "ipython" t)
 '(python-shell-virtualenv-root
   "e:/WORKSPACE/py_TDD-With-Python/py_TDD-With-Python/VIRTUAL/Scripts/")
 '(shell-pop-full-span nil t)
 '(spaceline-all-the-icons-icon-set-flycheck-slim (quote dots)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(spaceline-python-venv ((t (:foreground "slate blue"))))
 '(variable-pitch ((t (:foundry "outline" :family "Montserrat")))))

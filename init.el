;; -*- mode: emacs-lisp -*-
(if (file-readable-p "~/.spacemacs.d/spacemacs-layers.el") (load "~/.spacemacs.d/spacemacs-layers.el"))
(if (file-readable-p "~/.spacemacs.d/spacemacs-init.el") (load "~/.spacemacs.d/spacemacs-init.el"))
(if (file-readable-p "~/.spacemacs.d/user-init.el") (load "~/.spacemacs.d/user-init.el"))
(if (file-readable-p "~/.spacemacs.d/user-config.el") (load "~/.spacemacs.d/user-config.el"))

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(org-agenda-files
   '("~/Dropbox/org/projects/job.org" "~/Dropbox/org/inbox.org" "~/Dropbox/org/work.org" "~/Dropbox/org/home.org"))
 '(package-selected-packages
   '(info+ inspector zeal-at-point yasnippet-snippets yapfify yaml-mode xterm-color xresources-theme ws-butler writeroom-mode winum which-key web-mode web-beautify vterm volatile-highlights vim-powerline vi-tilde-fringe uuidgen use-package undo-tree treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil toml-mode toc-org terminal-here term-cursor tagedit symon symbol-overlay string-inflection string-edit sql-indent sphinx-doc spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline-all-the-icons space-doc solarized-theme smeargle slim-mode shell-pop scss-mode sass-mode rust-mode ron-mode restart-emacs rainbow-mode rainbow-delimiters quickrun pytest pylookup pyenv-mode pydoc py-isort pug-mode prettier-js popwin poetry plantuml-mode pippel pipenv pip-requirements pcre2el password-generator paradox overseer orgit-forge org-superstar open-junk-file npm-mode nose nodejs-repl nameless multi-term multi-line macrostep lsp-ui lsp-pyright lsp-origami lsp-latex lorem-ipsum livid-mode live-py-mode link-hint json-reformat json-navigator json-mode js2-refactor js-doc jinja2-mode indent-guide importmagic impatient-mode hybrid-mode hungry-delete holy-mode hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-xref helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-org helm-mode-manager helm-make helm-lsp helm-ls-git helm-git-grep helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gitignore-templates git-timemachine git-modes git-messenger git-link fuzzy font-lock+ flyspell-correct-helm flymd flycheck-rust flycheck-pos-tip flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-tex evil-surround evil-numbers evil-nerd-commenter evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-evilified-state evil-escape evil-ediff evil-easymotion evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emr emmet-mode elisp-slime-nav elisp-def ein editorconfig dumb-jump drag-stuff dotenv-mode doom-themes dired-quick-sort diminish devdocs define-word dap-mode cython-mode csv-mode company-web company-statistics company-reftex company-math company-auctex company-ansible company-anaconda column-enforce-mode code-cells clean-aindent-mode centered-cursor-mode cargo blacken auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile ansible-doc ansible aggressive-indent ace-link ace-jump-helm-line ac-ispell))
 '(warning-suppress-types '((use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t))
)

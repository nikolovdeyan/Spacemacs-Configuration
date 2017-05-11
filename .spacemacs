;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
	 (javascript :variables 
			      javascript-disable-tern-port-files nil
	              tern-command '("node" "c:/Users/Thoth/AppData/Roaming/npm/node_modules/tern/bin/tern")
				  tern-mode t
				  tern-auto-complete t
				  tern-ac-setup t
				  )
	 react
	 shell
     python
     markdown
     html
	 spacemacs-layouts
     helm
	 imenu-list
     (auto-completion :variables
                       auto-completion-enable-help-tooltip t
					   auto-completion-return-key-behavior nil
					   auto-completion-tab-key-behavior 'complete
					   auto-completion-enable-sort-by-usage t)
     better-defaults
     git
     org
     syntax-checking
     )
   dotspacemacs-additional-packages 
   '(
     simple-httpd 
	 impatient-mode 
	 rainbow-mode
	 ;;zerodark-theme
	 all-the-icons
	 flymd
	 mode-icons
	 ;;sourcerer-theme
	 vimish-fold
	 evil-vimish-fold
	 )
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update t
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner nil
   dotspacemacs-startup-lists nil
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'txt-mode
   dotspacemacs-themes 
   '(
	 solarized-light
	 spacemacs-dark
	 leuven
     spacemacs-light
	)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Roboto Mono"
                               :size 14
                               :weight medium
                               :width normal
                               :powerline-scale 1.2)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling nil
   dotspacemacs-line-numbers t
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode 'nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis 'nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'current
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository 'trailing
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
	(setq js2-include-node-externs t)
	(define-abbrev-table 'global-abbrev-table '(
    ("alpha" "α")
    ("inf" "∞")
    ("ar" "→")
    ))
	(abbrev-mode 1) 
	
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

;; Enable live render of markdown in browser provided by strapdownjs.com
;; used with httpd and impatient-mode
;; tell impatient mode to use it with M-x imp-set-user-filter RET markdown-html RET
;; Themes from http://bootswatch.com/ are included
;; Available themes: Amelia | Cerulean | Cyborg | Journal | Readable | Simplex
;; 					 Slate | Spacelab | Spruce | Superhero | United
	(defun markdown-html (buffer)
		(princ (with-current-buffer buffer
			(format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"slate\" style=\"display:none;\"> %s  </xmp><script src=\"http://strapdownjs.com/v/0.2/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
        (current-buffer)))
		
	(setq-default 
		js2-basic-offset 2	
		js-indent-level 2
		js-level-indent 2)

	;;(use-package zerodark-theme
	;;	:ensure t
	;;	:config
	;;		(zerodark-setup-modeline-format))
			
	;;	(spacemacs/set-leader-keys "onr" 'nodejs-repl-send-region)
		
	;; Powerline separator options:
	;; < alternate | arrow | arrow-fade | bar | box | brace | butt | chamfer | contour 
	;;   curve | rounded | roundstub | slant | wave | zigzag | nil > 
    
	(setq powerline-default-separator 'arrow)
    ;;(zerodark-setup-modeline-format)
	(mode-icons-mode)
	(org-agenda nil "a")
	;;(spaceline-compile)
	
	;; Folding

)
 

;; AUTO GENERATED BELOW
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#282c34" "#ff6c6b" "#98be65" "#da8548" "#61afef" "#c678dd" "#1f5582" "#abb2bf"])
 '(blink-cursor-mode nil)
 '(custom-safe-themes
   (quote
    ("d1f23191fd3c9d9d982b6c093ecb4b581bb3840b943d146cd319fe374c541b05" "8bb8a5b27776c39b3c7bf9da1e711ac794e4dc9d43e32a075d8aa72d6b5b3f59" "f5ad3af69f2b6b7c547208b8708d4fa7928b5697ca0845633d1d67c2d145952a" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(idle-update-delay 0.2)
 '(imenu-list-minor-mode t)
 '(js2-highlight-level 2)
 '(js2-init-hook nil)
 '(js2-mode-assume-strict t)
 '(package-selected-packages
   (quote
    (company-emacs-eclim eclim evil-vimish-fold sourcerer-theme sourcerer-theme-theme mwim xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help nodejs-repl doom-themes doom-dark-theme all-the-icons zerodark-theme-theme zerodark-theme mode-icons font-lock+ nav smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor imenu-list minimap flymd fontawesome zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme company-quickhelp flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck auto-dictionary helm-company helm-c-yasnippet company-web web-completion-data company-tern dash-functional company-statistics company-anaconda company auto-yasnippet ac-ispell tern-auto-complete auto-complete tern web-beautify livid-mode json-mode json-snatcher json-reformat js2-refactor yasnippet multiple-cursors js-doc coffee-mode skewer-mode js2-mode rainbow-mode omnisharp yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode anaconda-mode pythonic ac-html mmm-mode markdown-toc markdown-mode gh-md org-projectile pcache org-present org org-pomodoro alert log4e gntp org-download gnuplot org-plus-contrib impatient-mode htmlize simple-httpd web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme)))
 '(tool-bar-mode nil)
 '(window-divider-default-bottom-width 1)
 '(window-divider-default-places (quote right-only))
 '(window-divider-default-right-width 3)
 '(window-divider-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#fdf6e3" :foreground "#586E75" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 158 :width normal :foundry "outline" :family "Fantasque Sans Mono"))))
 '(css-property ((t (:inherit font-lock-variable-name-face :background "#F2F7FA" :box (:line-width -1 :color "#F2F7FA")))))
 '(css-selector ((t (:inherit font-lock-function-name-face :foreground "#4486B4" :weight bold))))
 '(font-lock-builtin-face ((t (:foreground "#A46583" :slant normal :weight bold))))
 '(font-lock-comment-face ((t (:background "#EEE8D5" :foreground "#BEB8A6" :box (:line-width 1 :color "#BEB8A6") :weight normal))))
 '(font-lock-function-name-face ((t (:foreground "#59819E" :weight normal))))
 '(font-lock-keyword-face ((t (:foreground "#5EAAA4" :weight normal))))
 '(font-lock-negation-char-face ((t (:foreground "#b58900"))))
 '(font-lock-string-face ((t (:foreground "#87712D" :slant normal :weight normal))))
 '(font-lock-variable-name-face ((t (:foreground "#59819E"))))
 '(highlight-numbers-number ((t (:foreground "#D33682" :weight normal))))
 '(hl-todo ((t (:background "#EAD4D4" :foreground "#cc9393" :box (:line-width 1 :color "#BEB8A6") :weight bold))))
 '(imenu-list-entry-face-0 ((t (:inherit imenu-list-entry-face :foreground "#657B83"))))
 '(js2-external-variable ((t (:foreground "OrangeRed4"))))
 '(js2-function-call ((t (:inherit default :foreground "#268BD2"))))
 '(js2-function-param ((t (:inherit default :foreground "#D33682"))))
 '(js2-object-property ((t (:inherit default :foreground "#D33682"))))
 '(js2-warning ((t (:background "#F7E5C6" :underline "#B58900"))))
 '(linum ((t (:background "#fdf6e3" :foreground "#D9D3C1" :underline nil :weight normal))))
 '(menu ((t (:background "#fdf6e3" :foreground "#657b83" :family "Roboto Condensed"))))
 '(minibuffer-prompt ((t (:foreground "#657b83" :family "Roboto Condensed"))))
 '(mode-line ((t (:background "#C9E2F4" :foreground "#657b83" :box (:line-width 1 :color "#C9E2F4" :style unspecified) :overline "#C9E2F4" :underline "#C9E2F4" :height 100 :family "Roboto Condensed"))))
 '(mode-line-buffer-id ((t (:background "#C9E2F4" :foreground "#586E75" :weight normal :height 100 :family "Roboto Condensed"))))
 '(mode-line-emphasis ((t (:weight bold :height 100 :family "Roboto Condensed"))))
 '(mode-line-highlight ((t (:box (:line-width 1 :color "grey40" :style pressed-button) :family "Roboto Condensed"))))
 '(mode-line-inactive ((t (:background "#C9E2F4" :foreground "#93a1a1" :box (:line-width 1 :color "#C9E2F4" :style unspecified) :overline "#C9E2F4" :underline "#C9E2F4" :height 100 :family "Roboto Condensed"))))
 '(org-formula ((t (:foreground "DeepSkyBlue4"))))
 '(org-level-1 ((t (:inherit variable-pitch :foreground "DeepSkyBlue1" :weight bold :height 1.3))))
 '(org-level-2 ((t (:inherit variable-pitch :foreground "DeepSkyBlue3" :height 1.2))))
 '(org-level-3 ((t (:inherit variable-pitch :foreground "SkyBlue1" :height 1.15))))
 '(org-level-4 ((t (:inherit variable-pitch :foreground "DodgerBlue3" :height 1.1))))
 '(org-meta-line ((t (:inherit font-lock-comment-face :foreground "DodgerBlue4"))))
 '(org-table ((t (:foreground "DeepSkyBlue3"))))
 '(powerline-active1 ((t (:inherit nil :background "#4486B4" :foreground "#FDF6E3"))))
 '(powerline-active2 ((t (:inherit nil :background "#4486B4" :foreground "#839496"))))
 '(powerline-inactive1 ((t (:inherit nil :background "#EEE8D5" :foreground "#839496" :weight normal))))
 '(powerline-inactive2 ((t (:inherit nil :background "#EEE8D5" :foreground "#93a1a1"))))
 '(show-paren-match ((t (:foreground "#d33682" :weight bold))))
 '(sp-show-pair-match-face ((t (:background "#D6D0BD" :foreground "#93A1A1"))))
 '(variable-pitch ((t (:slant normal :weight normal :height 158 :width normal :foundry "outline" :family "DejaVu Sans"))))
 '(vertical-border ((t (:foreground "#268BD2"))))
 '(web-mode-comment-face ((t (:foreground "#BEB8A6" :box (:line-width 1 :color "#BEB8A6") :weight bold))))
 '(web-mode-folded-face ((t (:background "#eee8d5" :foreground "#999484" :box (:line-width 1 :color "#D9D3C1" :style released-button) :underline nil))))
 '(web-mode-html-attr-name-face ((t (:foreground "#5F97BF" :slant normal))))
 '(web-mode-html-attr-value-face ((t (:foreground "#B75182" :slant normal :weight normal))))
 '(web-mode-html-tag-bracket-face ((t (:foreground "#8F92C0" :weight extra-bold))))
 '(web-mode-html-tag-face ((t (:foreground "#8F92C0" :weight bold))))
 '(web-mode-string-face ((t (:foreground "#585241"))))
 '(window-divider ((t (:foreground "#EEE8D5"))))
 '(window-divider-first-pixel ((t (:foreground "#EEE8D5"))))
 '(window-divider-last-pixel ((t (:foreground "#EEE8D5")))))

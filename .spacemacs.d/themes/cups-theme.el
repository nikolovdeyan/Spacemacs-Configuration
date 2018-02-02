;;; cups-theme.el --- Full color theme for spacemacs

;;; Code:

(deftheme cups "Fiery Waters")


(defgroup cups-theme nil
  "Cups-theme options."
:group 'faces)

(defcustom cups-theme-comment-bg t
  "Use a background for comment lines."
  :type 'boolean
:group 'cups-theme)

(defcustom spacemacs-theme-comment-italic nil
  "Enable italics for comments and also disable background."
  :type 'boolean
:group 'cups-theme)

(defvar cups-default-colors-alist
  '(("cups-fg+1"       . "#a69ba0")
    ("cups-fg"         . "#8c8186")
    ("cups-fg-1"       . "#30262a")
    ("cups-bg+2"       . "#403539")
    ("cups-bg+1"       . "#382e32")
    ("cups-bg"         . "#291f23")
    ("cups-bg-1"       . "#1f161a")
    ("cups-bg-2"       . "#191215")
    ("cups-red+1"      . "#df7784")
    ("cups-red"        . "#bb5766")
    ("cups-red-1"      . "#9e3e4e")
    ("cups-redbg"      . "#833245")
    ("cups-redbg-1"    . "#611229")
    ("cups-green+1"    . "#74a264")
    ("cups-green"      . "#59864a")
    ("cups-green-1"    . "#57724e")
    ("cups-greenbg"    . "#496340")
    ("cups-greenbg-1"  . "#214a21")
    ("cups-blue+1"     . "#7aa0d5")
    ("cups-blue"       . "#4a73a5")
    ("cups-blue-1"     . "#356190")
    ("cups-bluebg"     . "#284d73")
    ("cups-bluebg-1"   . "#1d3954")
    ("cups-yellow"     . "#caba4e")
    ("cups-yellow-1"   . "#998d1f")
    ("cups-yellowbg"   . "#5a5400")
    ("cups-orange"     . "#c26a4d")
    ("cups-cyan"       . "#53aab2")
    ("cups-magenta"    . "#b765ae"))

  "List of cups colors.
Each element has the form (NAME . HEX).

`+N' suffixes indicate a color is lighter.
`-N' suffixes indicate a color is darker.")

(defvar cups-override-colors-alist
  '()
  "Place to override default colors.

You can override a subset of the theme's default colors by
defining them in this alist before loading the theme.")

(defvar cups-colors-alist
  (append cups-default-colors-alist cups-override-colors-alist))

(defmacro cups-with-color-variables (&rest body)
  "`let' bind all colors defined in `cups-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   cups-colors-alist))
     ,@body))

;;; Theme Faces
(cups-with-color-variables
  (custom-theme-set-faces
   'cups
    ;; Basic defaults
    `(default ((,class (:background ,cups-bg :foreground ,cups-fg))))
    `(default-italic ((,class (:italic t))))
    `(custom-button ((,class :background ,cups-bg+2 :foreground ,cups-fg+1 :box (:line-width 2 :style released-button))))
    ;;`(link ((,class (:foreground ,comment :underline t))))
    ;;`(link-visited ((,class (:foreground ,comp :underline t))))
	
	;; GUI AND APPEARANCE
    `(fringe ((,class (:background ,cups-bg-2 :foreground ,cups-bg+2))))
	`(linum ((,class (:background ,cups-bg-2 :foreground ,cups-bg+2))))
    `(vertical-border ((,class (:foreground ,cups-bg-2))))
    `(cursor ((,class (:background ,cups-bg-2))))
    `(hl-line ((,class (:background ,cups-bg-1))))
    `(region ((,class (:background ,cups-bluebg-1))))
    ;;`(highlight ((,class (:foreground ,base :background ,highlight))))
    ;;`(lazy-highlight ((,class (:background ,green-bg-s :weight normal))))
	
	;; MODELINE, POWERLINE, SPACELINE
    `(mode-line            ((,class (:foreground ,cups-fg+1 :background ,cups-bg-2 :box (:color ,cups-bg-2 :line-width 2))))) ;; git status
    `(mode-line-buffer-id  ((,class (:inherit cups-fg+1 :foreground ,cups-fg))))
    `(mode-line-inactive   ((,class (:foreground ,cups-fg+1 :background ,cups-bg-2 :box (:color ,cups-bg-2 :line-width 2)))))
	`(powerline-active1 ((,class (:foreground ,cups-fg+1 :background ,cups-bluebg)))) ;;project, major-mode, buffer-id, clock
    `(powerline-active2 ((,class (:foreground ,cups-fg+1 :background ,cups-bluebg))));; empty space
    `(powerline-inactive1 ((,class (:foreground ,cups-fg+1 :background ,cups-bluebg))))
    `(powerline-inactive2 ((,class (:foreground ,cups-fg+1 :background ,cups-bg-2))))
    `(spaceline-python-venv ((,class (:foreground ,cups-fg+1)))) ;; python mode virtualenv
	
	 `(spacemacs-normal-face ((t (:background ,cups-yellow :foreground ,cups-fg+1))))
     `(spacemacs-insert-face ((t (:background ,cups-green+1 :foreground ,cups-fg+1))))
     `(spacemacs-motion-face ((t (:background ,cups-bg-2 :foreground ,cups-fg+1))))
     `(spacemacs-visual-face ((t (:background ,cups-blue-1 :foreground ,cups-fg+1))))
     `(spacemacs-iedit-face ((t (:background "firebrick1" :foreground ,cups-fg+1))))
     `(spacemacs-iedit-insert-face ((t (:background ,cups-green+1 :foreground ,cups-fg+1))))
     `(spacemacs-lisp-face ((t (:background ,cups-magenta :foreground ,cups-fg+1))))
     `(spacemacs-evilified-face ((t (:background ,cups-yellow :foreground ,cups-fg+1))))
     `(spacemacs-replace-face ((t (:background ,cups-bg-2 :foreground ,cups-fg))))
     `(spacemacs-hybrid-face ((t (:background ,cups-red-1 :foreground ,cups-fg+1))))
     `(spacemacs-emacs-face ((t (:background ,cups-magenta :foreground ,cups-fg+1))))
	
	;; Errors, warnings, messages
    `(error ((,class (:foreground ,cups-red+1))))
    `(spaceline-flycheck-error  ((,class (:foreground ,cups-red+1))))
	`(warning ((,class (:foreground ,cups-orange))))
    `(spaceline-flycheck-warning((,class (:foreground ,cups-orange))))
    `(success ((,class (:foreground ,cups-green+1))))
    `(spaceline-flycheck-info   ((,class (:foreground ,cups-cyan))))
		
    `(eval-sexp-fu-flash ((,class (:background ,cups-green :foreground ,cups-bg)))) 
    `(eval-sexp-fu-flash-error ((,class (:background ,cups-red+1 :foreground ,cups-bg))))	
	
    `(font-lock-builtin-face ((,class (:foreground ,cups-blue))))
    `(font-lock-comment-face ((,class (:foreground ,(if spacemacs-theme-comment-italic comment-light cups-fg-1) :background ,(when spacemacs-theme-comment-bg cups-bg) :slant ,(if spacemacs-theme-comment-italic 'italic 'normal)))))
    `(font-lock-constant-face ((,class (:foreground ,cups-fg))))
    `(font-lock-doc-face ((,class (:foreground ,cups-green-1))))
    `(font-lock-function-name-face ((,class (:foreground ,cups-red-1 :inherit bold))))
    `(font-lock-keyword-face ((,class (:inherit bold :foreground ,cups-yellow-1))))
    `(font-lock-negation-char-face ((,class (:foreground ,cups-yellow))))
    `(font-lock-preprocessor-face ((,class (:foreground ,cups-yellow))))
    `(font-lock-reference-face ((,class (:foreground ,cups-fg))))
    `(font-lock-string-face ((,class (:foreground ,cups-yellow-1))))
    `(font-lock-type-face ((,class (:foreground ,cups-red :inherit bold))))
    `(font-lock-variable-name-face ((,class (:foreground ,cups-fg))))
    `(font-lock-warning-face ((,class (:foreground ,cups-orange :background ,cups-bg))))	
	

    `(header-line ((,class :background ,cups-bg-1))) ;; header of helm
    `(minibuffer-prompt ((,class (:foreground ,cups-blue))))
    ;;`(isearch ((,class (:foreground ,bg1 :background ,mat))))
    ;;`(match ((,class (:background ,highlight :foreground ,mat))))
    ;;`(page-break-lines ((,class (:foreground ,act2))))
    ;;`(secondary-selection ((,class (:background ,bg3))))
    ;;`(shadow ((,class (:foreground ,base-dim))))

    ;;`(tooltip ((,class (:background ,ttip-sl :foreground ,base :bold nil :italic nil :underline nil))))

	;; HELM
    ;; `(helm-bookmark-directory ((,class (:inherit helm-ff-directory))))
    ;; `(helm-bookmark-file ((,class (:foreground ,base))))
    ;; `(helm-bookmark-gnus ((,class (:foreground ,comp))))
    ;; `(helm-bookmark-info ((,class (:foreground ,comp))))
    ;; `(helm-bookmark-man ((,class (:foreground ,comp))))
    ;; `(helm-bookmark-w3m ((,class (:foreground ,comp))))
    ;; `(helm-buffer-directory ((,class (:foreground ,base :background ,bg1))))
    ;; `(helm-buffer-file ((,class (:foreground ,base :background ,bg1))))
    ;; `(helm-buffer-not-saved ((,class (:foreground ,comp :background ,bg1))))
    ;; `(helm-buffer-process ((,class (:foreground ,keyword :background ,bg1))))
    ;; `(helm-buffer-saved-out ((,class (:foreground ,base :background ,bg1))))
    ;; `(helm-buffer-size ((,class (:foreground ,base :background ,bg1))))
    ;; `(helm-candidate-number ((,class (:background ,bg1 :foreground ,keyword :inherit bold))))
    ;; `(helm-ff-directory ((,class (:foreground ,keyword :background ,bg1 :inherit bold))))
    ;; `(helm-ff-dotted-directory ((,class (:foreground ,keyword :background ,bg1 :inherit bold))))
    ;; `(helm-ff-dotted-symlink-directory ((,class (:foreground ,cyan :background ,bg1 :inherit bold))))
    ;; `(helm-ff-executable ((,class (:foreground ,suc :background ,bg1 :weight normal))))
    ;; `(helm-ff-file ((,class (:foreground ,base :background ,bg1 :weight normal))))
    ;; `(helm-ff-invalid-symlink ((,class (:foreground ,red :background ,bg1 :inherit bold))))
    ;; `(helm-ff-prefix ((,class (:foreground ,bg1 :background ,keyword :weight normal))))
    ;; `(helm-ff-symlink ((,class (:foreground ,cyan :background ,bg1 :inherit bold))))
    ;; `(helm-grep-cmd-line ((,class (:foreground ,base :background ,bg1))))
    ;; `(helm-grep-file ((,class (:foreground ,base :background ,bg1))))
    ;; `(helm-grep-finish ((,class (:foreground ,base :background ,bg1))))
    ;; `(helm-grep-lineno ((,class (:foreground ,type :background ,bg1 :inherit bold))))
    ;; `(helm-grep-match ((,class (:foreground nil :background nil :inherit helm-match))))
    ;; `(helm-header ((,class (:foreground ,base :background ,bg1 :underline nil :box nil))))
    ;; `(helm-header-line-left-margin ((,class (:foreground ,keyword :background ,nil))))
    ;; `(helm-match ((,class (:background ,head1-bg :foreground ,head1))))
    ;; `(helm-match-item ((,class (:background ,head1-bg :foreground ,head1))))
    ;; `(helm-moccur-buffer ((,class (:foreground ,var :background ,bg1))))
     `(helm-selection ((,class (:background ,cups-bg-1))))
     `(helm-selection-line ((,class (:background ,cups-bg-2))))
    ;; `(helm-separator ((,class (:foreground ,comp :background ,bg1))))
     `(helm-source-header ((,class (:background ,cups-bluebg :foreground ,cups-bg-2 :inherit bold))))
    ;; `(helm-time-zone-current ((,class (:foreground ,keyword :background ,bg1))))
    ;; `(helm-time-zone-home ((,class (:foreground ,comp :background ,bg1))))
    ;; `(helm-visible-mark ((,class (:foreground ,keyword :background ,bg3))))	

    ;; show-paren
     `(show-paren-match ((,class (:background ,cups-greenbg-1))))
     `(show-paren-mismatch ((,class (:background ,cups-redbg))))
	 
    ;; rainbow-delimiters
     `(rainbow-delimiters-depth-1-face ((,class :foreground ,cups-green+1)))
     `(rainbow-delimiters-depth-2-face ((,class :foreground ,cups-green)))
     `(rainbow-delimiters-depth-3-face ((,class :foreground ,cups-green-1)))
     `(rainbow-delimiters-depth-4-face ((,class :foreground ,cups-yellow-1)))
     `(rainbow-delimiters-depth-5-face ((,class :foreground ,cups-yellow-1)))
     `(rainbow-delimiters-depth-6-face ((,class :foreground ,cups-yellow-1)))
     `(rainbow-delimiters-depth-7-face ((,class :foreground ,cups-yellow-1)))
     `(rainbow-delimiters-depth-8-face ((,class :foreground ,cups-yellow-1)))
     `(rainbow-delimiters-mismatched-face ((,class :foreground ,cups-red+1 :overline t)))
     `(rainbow-delimiters-unmatched-face ((,class :foreground ,cups-red+1 :overline t)))	
   ))


(defvar cups-add-font-lock-keywords nil
  "Whether to add font-lock keywords for cups color names.
In buffers visiting library `cups-theme.el' the cups
specific keywords are always added.  In all other Emacs-Lisp
buffers this variable controls whether this should be done.
This requires library `rainbow-mode'.")

(defvar cups-colors-font-lock-keywords nil)

;;; Footer

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'cups)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; End:
;;; cups-theme.el ends here

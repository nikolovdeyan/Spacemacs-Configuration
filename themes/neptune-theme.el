;;; neptune-theme.el --- Full color theme for spacemacs

;;; Code:

(deftheme neptune "Fiery Waters")


(defgroup neptune-theme nil
  "neptune-theme options."
:group 'faces)

(defcustom neptune-theme-comment-bg t
  "Use a background for comment lines."
  :type 'boolean
:group 'neptune-theme)

(defcustom spacemacs-theme-comment-italic nil
  "Enable italics for comments and also disable background."
  :type 'boolean
:group 'neptune-theme)

(defvar neptune-default-colors-alist
  '(("neptune-fg+1"       . "#A6B4E9")
    ("neptune-fg"         . "#8b98cc")
    ("neptune-fg-1"       . "#7482B4")
    ("neptune-bg+2"       . "#404563")
    ("neptune-bg+1"       . "#2b314d")
    ("neptune-bg"         . "#1e2540")
    ("neptune-bg-1"       . "#101832")
    ("neptune-bg-2"       . "#020825")	
    ("neptune-red+1"      . "#FF563B")
    ("neptune-red"        . "#e23210")
    ("neptune-red-1"      . "#C10000")
    ("neptune-redbg"      . "#740000")
    ("neptune-redbg-1"    . "#660000")
    ("neptune-green+1"    . "#7DAC2F")
    ("neptune-green"      . "#67900a")
    ("neptune-green-1"    . "#4C7600")
    ("neptune-greenbg"    . "#163900")
    ("neptune-greenbg-1"  . "#152E00")
    ("neptune-blue+1"     . "#74B0FF")
    ("neptune-blue"       . "#568efd")
    ("neptune-blue-1"     . "#2D74DF")
    ("neptune-bluebg"     . "#284d73")
    ("neptune-bluebg-1"   . "#1d3954")
    ("neptune-yellow"     . "#e3b23e")
    ("neptune-yellow-1"   . "#B68A0C")
    ("neptune-yellowbg"   . "#4A2B00")
    ("neptune-orange"     . "#e47000")
    ("neptune-cyan"       . "#00afc7")
    ("neptune-magenta"    . "#d64abe")
    ("neptune-violet"     . "#9f72ff")	
	)

  "List of neptune colors.
Each element has the form (NAME . HEX).

`+N' suffixes indicate a color is lighter.
`-N' suffixes indicate a color is darker.")

(defvar neptune-override-colors-alist
  '()
  "Place to override default colors.

You can override a subset of the theme's default colors by
defining them in this alist before loading the theme.")

(defvar neptune-colors-alist
  (append neptune-default-colors-alist neptune-override-colors-alist))

(defmacro neptune-with-color-variables (&rest body)
  "`let' bind all colors defined in `neptune-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   neptune-colors-alist))
     ,@body))

;;; Theme Faces
(neptune-with-color-variables
  (custom-theme-set-faces
   'neptune
    ;; Basic defaults
    `(default ((,class (:background ,neptune-bg :foreground ,neptune-fg))))
    `(default-italic ((,class (:italic t))))
    `(custom-button ((,class :background ,neptune-bg+2 :foreground ,neptune-fg+1 :box (:line-width 2 :style released-button))))
    ;;`(link ((,class (:foreground ,comment :underline t))))
    ;;`(link-visited ((,class (:foreground ,comp :underline t))))
	
	;; GUI AND APPEARANCE
    `(fringe ((,class (:background ,neptune-bg-1 :foreground ,neptune-bg+2))))
	`(linum ((,class (:background ,neptune-bg-1 :foreground ,neptune-bg+2))))
    `(vertical-border ((,class (:foreground ,neptune-bg-1))))
    `(cursor ((,class (:background ,neptune-bg-2))))
    `(hl-line ((,class (:background ,neptune-bg-1))))
    `(region ((,class (:background ,neptune-bluebg-1))))
    ;;`(highlight ((,class (:foreground ,base :background ,highlight))))
    ;;`(lazy-highlight ((,class (:background ,green-bg-s :weight normal))))
	
	;; MODELINE, POWERLINE, SPACELINE
    `(mode-line            ((,class (:foreground ,neptune-fg+1 :background ,neptune-bg-2 :box (:color ,neptune-bg-2 :line-width 2))))) ;; git status
    `(mode-line-buffer-id  ((,class (:inherit neptune-fg+1 :foreground ,neptune-fg))))
    `(mode-line-inactive   ((,class (:foreground ,neptune-fg+1 :background ,neptune-bg-2 :box (:color ,neptune-bg-2 :line-width 2)))))
	`(powerline-active1 ((,class (:foreground ,neptune-fg+1 :background ,neptune-bluebg)))) ;;project, major-mode, buffer-id, clock
    `(powerline-active2 ((,class (:foreground ,neptune-fg+1 :background ,neptune-bluebg))));; empty space
    `(powerline-inactive1 ((,class (:foreground ,neptune-fg+1 :background ,neptune-bluebg))))
    `(powerline-inactive2 ((,class (:foreground ,neptune-fg+1 :background ,neptune-bg-2))))
    `(spaceline-python-venv ((,class (:foreground ,neptune-fg+1)))) ;; python mode virtualenv
	
	 `(spacemacs-normal-face ((t (:background ,neptune-yellow :foreground ,neptune-fg+1))))
     `(spacemacs-insert-face ((t (:background ,neptune-green+1 :foreground ,neptune-fg+1))))
     `(spacemacs-motion-face ((t (:background ,neptune-bg-2 :foreground ,neptune-fg+1))))
     `(spacemacs-visual-face ((t (:background ,neptune-blue-1 :foreground ,neptune-fg+1))))
     `(spacemacs-iedit-face ((t (:background "firebrick1" :foreground ,neptune-fg+1))))
     `(spacemacs-iedit-insert-face ((t (:background ,neptune-green+1 :foreground ,neptune-fg+1))))
     `(spacemacs-lisp-face ((t (:background ,neptune-magenta :foreground ,neptune-fg+1))))
     `(spacemacs-evilified-face ((t (:background ,neptune-yellow :foreground ,neptune-fg+1))))
     `(spacemacs-replace-face ((t (:background ,neptune-bg-2 :foreground ,neptune-fg))))
     `(spacemacs-hybrid-face ((t (:background ,neptune-red-1 :foreground ,neptune-fg+1))))
     `(spacemacs-emacs-face ((t (:background ,neptune-magenta :foreground ,neptune-fg+1))))
	
	;; Errors, warnings, messages
    `(error ((,class (:foreground ,neptune-red+1))))
    `(spaceline-flycheck-error  ((,class (:foreground ,neptune-red+1))))
	`(warning ((,class (:foreground ,neptune-orange))))
    `(spaceline-flycheck-warning((,class (:foreground ,neptune-orange))))
    `(success ((,class (:foreground ,neptune-green+1))))
    `(spaceline-flycheck-info   ((,class (:foreground ,neptune-cyan))))
		
    `(eval-sexp-fu-flash ((,class (:background ,neptune-green :foreground ,neptune-bg)))) 
    `(eval-sexp-fu-flash-error ((,class (:background ,neptune-red+1 :foreground ,neptune-bg))))	
	
    `(font-lock-builtin-face ((,class (:foreground ,neptune-blue))))
    `(font-lock-comment-face ((,class (:foreground ,(if spacemacs-theme-comment-italic comment-light neptune-fg-1) :background ,(when spacemacs-theme-comment-bg neptune-bg) :slant ,(if spacemacs-theme-comment-italic 'italic 'normal)))))
    `(font-lock-constant-face ((,class (:foreground ,neptune-fg))))
    `(font-lock-doc-face ((,class (:foreground ,neptune-green-1))))
    `(font-lock-function-name-face ((,class (:foreground ,neptune-red-1 :inherit bold))))
    `(font-lock-keyword-face ((,class (:inherit bold :foreground ,neptune-yellow-1))))
    `(font-lock-negation-char-face ((,class (:foreground ,neptune-yellow))))
    `(font-lock-preprocessor-face ((,class (:foreground ,neptune-yellow))))
    `(font-lock-reference-face ((,class (:foreground ,neptune-fg))))
    `(font-lock-string-face ((,class (:foreground ,neptune-yellow-1))))
    `(font-lock-type-face ((,class (:foreground ,neptune-red :inherit bold))))
    `(font-lock-variable-name-face ((,class (:foreground ,neptune-fg))))
    `(font-lock-warning-face ((,class (:foreground ,neptune-orange :background ,neptune-bg))))	
	

    `(header-line ((,class :background ,neptune-bg-1))) ;; header of helm
    `(minibuffer-prompt ((,class (:foreground ,neptune-blue))))
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
    ;; `(helm-grep-cmd-line ((,class (:foreground ,neptune-red :background ,neptune-redbg))))
    ;; `(helm-grep-file ((,class (:foreground ,base :background ,bg1))))
    ;; `(helm-grep-finish ((,class (:foreground ,base :background ,bg1))))
    ;; `(helm-grep-lineno ((,class (:foreground ,type :background ,bg1 :inherit bold))))
    ;; `(helm-grep-match ((,class (:foreground nil :background nil :inherit helm-match))))
    ;; `(helm-header ((,class (:foreground ,base :background ,bg1 :underline nil :box nil))))
    ;; `(helm-header-line-left-margin ((,class (:foreground ,keyword :background ,nil))))
    ;; `(helm-match ((,class (:background ,head1-bg :foreground ,head1))))
    ;; `(helm-match-item ((,class (:background ,head1-bg :foreground ,head1))))
    ;; `(helm-moccur-buffer ((,class (:foreground ,var :background ,bg1))))
     `(helm-selection ((,class (:background ,neptune-bg+2)))) ;; selection line in emacs command history menu
     `(helm-selection-line ((,class (:background ,neptune-bg-2))))
    ;; `(helm-separator ((,class (:foreground ,comp :background ,bg1))))
     `(helm-source-header ((,class (:background ,neptune-bluebg :foreground ,neptune-bg-2 :inherit bold))))
    ;; `(helm-time-zone-current ((,class (:foreground ,keyword :background ,bg1))))
    ;; `(helm-time-zone-home ((,class (:foreground ,comp :background ,bg1))))
    ;; `(helm-visible-mark ((,class (:foreground ,keyword :background ,bg3))))	

    ;; show-paren
     `(show-paren-match ((,class (:background ,neptune-greenbg-1))))
     `(show-paren-mismatch ((,class (:background ,neptune-redbg))))
	 
    ;; rainbow-delimiters
     `(rainbow-delimiters-depth-1-face ((,class :foreground ,neptune-green+1)))
     `(rainbow-delimiters-depth-2-face ((,class :foreground ,neptune-green)))
     `(rainbow-delimiters-depth-3-face ((,class :foreground ,neptune-green-1)))
     `(rainbow-delimiters-depth-4-face ((,class :foreground ,neptune-yellow-1)))
     `(rainbow-delimiters-depth-5-face ((,class :foreground ,neptune-yellow-1)))
     `(rainbow-delimiters-depth-6-face ((,class :foreground ,neptune-yellow-1)))
     `(rainbow-delimiters-depth-7-face ((,class :foreground ,neptune-yellow-1)))
     `(rainbow-delimiters-depth-8-face ((,class :foreground ,neptune-yellow-1)))
     `(rainbow-delimiters-mismatched-face ((,class :foreground ,neptune-red+1 :overline t)))
     `(rainbow-delimiters-unmatched-face ((,class :foreground ,neptune-red+1 :overline t)))	
   ))


(defvar neptune-add-font-lock-keywords nil
  "Whether to add font-lock keywords for neptune color names.
In buffers visiting library `neptune-theme.el' the neptune
specific keywords are always added.  In all other Emacs-Lisp
buffers this variable controls whether this should be done.
This requires library `rainbow-mode'.")

(defvar neptune-colors-font-lock-keywords nil)

;;; Footer

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'neptune)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; End:
;;; neptune-theme.el ends here

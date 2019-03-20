;; -*- mode: emacs-lisp -*-
(defun dotspacemacs/user-init ()
  (add-to-list 'custom-theme-load-path "~/.spacemacs.d/themes/")
  ;;
  ;;  encoding configuration
  ;;
  (set-charset-priority 'unicode)
  (set-terminal-coding-system  'utf-8)
  (set-keyboard-coding-system  'utf-8)
  (set-selection-coding-system 'utf-8)
  (prefer-coding-system        'utf-8)
  ;;
  ;;  additional faces
  ;;
  (defvar font-lock-operator-face 'font-lock-operator-face)
  (defface font-lock-operator-face
    '((((class color)) (
                        :inherit font-lock-function-name-face
                                 :weight normal)))
    "Font Lock mode face used to highlight operators."
    :group 'font-lock-extras)
)

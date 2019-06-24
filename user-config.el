;; -*- mode: emacs-lisp -*-
(defun dotspacemacs/user-config ()
  ;;
  ;;  key bindings
  ;;
  ;;  'o' is the leader key reserved for user-defined keys
  (spacemacs/set-leader-keys "oi" 'helm-semantic-or-imenu)
  (spacemacs/set-leader-keys "os" 'yas-insert-snippet)
  (spacemacs/set-leader-keys "oe" 'org-entities-help)
  (global-set-key (kbd "C-+") 'text-scale-increase)
  (global-set-key (kbd "C--") 'text-scale-decrease)
  (global-set-key (kbd "C-0") 'text-scale-adjust)

  ;;
	;;  settings for dash/zeal
  ;;
	(setq dash-helm-dash-docset-path "/home/deo/.local/share/Zeal/Zeal/docsets")
	(setq helm-dash-common-docsets '("Bash" "HTML" "JavaScript" "Python_3"))
	(add-hook 'python-mode-hook (lambda ()
    (setq-local helm-dash-docsets '("Python_3" "Django" "Bash"))))
  (add-hook 'js2-mode-hook (lambda ()
     (setq-local helm-dash-docsets '("JavaScript" "HTML" "CSS"))))
	(add-hook 'web-mode-hook (lambda ()
     (setq-local helm-dash-docsets '("HTML" "CSS" "Emmet"))))
	(add-hook 'css-mode-hook (lambda ()
     (setq-local helm-dash-docsets '("HTML" "CSS" "Emmet"))))
  ;;
  ;; enable visual-line-mode in text buffers
  ;;
  (add-hook 'text-mode-hook 'turn-on-visual-line-mode)

  (add-hook 'python-mode-hook (lambda ()
                                (setq
                                 python-backend 'anaconda
                                 python-fill-column 99
                                 python-enable-yapf-format-on-save t
                                 flycheck-checker 'python-pylint
                                 flycheck-pylintrc ".pylintrc"
                                 flycheck-checker-error-threshold 500
									               )))
)

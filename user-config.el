;; -*- mode: emacs-lisp -*-
(defun dotspacemacs/user-config ()
  ;;
  ;;  key bindings
  ;;
  ;;  'o' is the leader key reserved for user-defined keys
  (spacemacs/set-leader-keys "oi" 'helm-semantic-or-imenu)
  (global-set-key (kbd "C-+") 'text-scale-increase)
  (global-set-key (kbd "C--") 'text-scale-decrease)
  (global-set-key (kbd "C-0") 'text-scale-adjust)

  ;;
	;;  settings for dash/zeal
  ;;
	(setq dash-helm-dash-docset-path "/home/deo/.local/share/Zeal/Zeal/docsets")
	(setq helm-dash-common-docsets '("Bash" "HTML" "JavaScript" "Python_3"))
	(setq helm-dash-browser-func 'aww)
	(setq browse-url-browser-function 'eww-browse-url)
	(add-hook 'python-mode-hook (lambda ()
    (setq-local helm-dash-docsets '("Python_3" "Django" "Bash"))))
  (add-hook 'js2-mode-hook (lambda ()
     (setq-local helm-dash-docsets '("JavaScript" "HTML" "CSS"))))
	(add-hook 'web-mode-hook (lambda ()
     (setq-local helm-dash-docsets '("HTML" "CSS" "Emmet"))))
	(add-hook 'css-mode-hook (lambda ()
     (setq-local helm-dash-docsets '("HTML" "CSS" "Emmet"))))
 )


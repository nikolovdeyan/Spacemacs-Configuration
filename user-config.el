;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/user-config ()
  (spacemacs/set-leader-keys "oi" 'helm-semantic-or-imenu)

  (global-set-key (kbd "C-+") 'text-scale-increase)
  (global-set-key (kbd "C--") 'text-scale-decrease)
  (global-set-key (kbd "C-0") 'text-scale-adjust)

	;; Settings for dash/zeal
	(setq dash-helm-dash-docset-path "/home/deo/.local/share/Zeal/Zeal/docsets")
	(setq helm-dash-common-docsets '("Bash" "HTML" "JavaScript" "Python_3"))
	(setq helm-dash-browser-func 'eww)
	(setq browse-url-browser-function 'eww-browse-url)
	(add-hook 'python-mode-hook (lambda ()
    (setq-local helm-dash-docsets '("Python_3" "Django"))))
  (add-hook 'js2-mode-hook (lambda ()
     (setq-local helm-dash-docsets '("JavaScript" "HTML" "CSS"))))
	(add-hook 'web-mode-hook (lambda ()
     (setq-local helm-dash-docsets '("HTML" "CSS" "Emmet"))))
	(add-hook 'css-mode-hook (lambda ()
     (setq-local helm-dash-docsets '("HTML" "CSS" "Emmet"))))


	(add-hook 'js2-mode-hook
    (lambda () (mapc (lambda (pair) (push pair prettify-symbols-alist))
      '(("=>" . (#x00A0 (Br . Bl) #xe13f))
      (">=" . (#x00A0 (Br . Bl) #xe145))
      ("<=" . (#x00A0 (Br . Bl) #xe141))))
      (setq prettify-symbols-unprettify-at-point t)
      (prettify-symbols-mode)))
	(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
	(add-hook 'js2-mode-hook 'highlight-operators-js)
  (set-fontset-font "fontset-default" #xe13f "Fira Code Symbol")
  (set-fontset-font "fontset-default" #xe145 "Fira Code Symbol")
  (set-fontset-font "fontset-default" #xe141 "Fira Code Symbol")
 )


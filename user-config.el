;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/user-config ()
  (spacemacs/set-leader-keys "oi" 'helm-semantic-or-imenu)

  (global-set-key (kbd "C-+") 'text-scale-increase)
  (global-set-key (kbd "C--") 'text-scale-decrease)
  (global-set-key (kbd "C-)") 'text-scale-adjust)

	;; Settings for dash
	(setq dash-helm-dash-docset-path "~/.docsets")
	(setq helm-dash-common-docsets '("Bash" "HTML" "JavaScript" "Python_3"))
	(setq helm-dash-browser-func 'eww)
	(setq browse-url-browser-function 'eww-browse-url)
	(add-hook 'python-mode-hook (lambda ()
    (setq-local helm-dash-docsets '("Python_3" "Django"))))
  (add-hook 'js2-mode-hook (lambda ()
     (setq-local helm-dash-docsets '("JavaScript" "jQuery"))))
	(add-hook 'web-mode-hook (lambda ()
     (setq-local helm-dash-docsets '("HTML" "CSS"))))
	(add-hook 'css-mode-hook (lambda ()
     (setq-local helm-dash-docsets '("HTML" "CSS"))))

	(use-package js2-mode
    :config
      (setq
   	   js2-basic-offset 2
        js-indent-level 2
        js-level-indent 2
        js2-idle-timer-delay 0.1
        js2-strict-trailing-comma-warning nil
        js2-include-node-externs t))

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

	(add-hook 'text-mode-hook 'visual-line-mode)
	(require 'ox-latex)
	(require 'ox-beamer)
	(unless (boundp 'org-latex-classes)
	  (setq org-latex-classes nil))
  (add-to-list 'org-latex-classes
	  '("article"
    "\\documentclass[a4paper,12pt]{article}
	  "
    ("\\section{%s}" . "\\section*{%s}")
    ("\\subsection{%s}" . "\\subsection*{%s}")
    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
    ("\\paragraph{%s}" . "\\paragraph*{%s}")
    ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (add-to-list 'org-latex-classes
	  '("dnick-recipe"
    "\\documentclass[a4paper,10pt]{scrartcl}
    \\usepackage[utf8]{inputenc}
    \\usepackage[T1]{fontenc}
    \\usepackage{geometry}
    \\geometry{a4paper,left=1.75cm,top=1.75cm,right=1.5cm,bottom=1.75cm,marginparsep=7pt, marginparwidth=.6in}
    \\usepackage{graphicx}
    \\usepackage{longtable}
    \\usepackage{hyperref}
    \\usepackage{natbib}
    \\usepackage{amssymb}
    \\usepackage{amsmath}
    [NO-DEFAULT-PACKAGES]
    [NO-PACKAGES]"
    ("\\section{%s}" . "\\section*{%s}")
	  ("\\subsection{%s}" . "\\subsection*{%s}")
    ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
 )

 (use-package all-the-icons)
 (use-package spaceline-all-the-icons
   :after spaceline
   :init
     (setq spaceline-all-the-icons-slim-render t
     spaceline-all-the-icons-primary-separator ""
     spaceline-all-the-icons-secondary-separator ""
     spaceline-all-the-icons-separator-type 'arrow
     spaceline-all-the-icons-flycheck-alternate nil
     spaceline-all-the-icons-hide-long-buffer-path t
     spaceline-all-the-icons-highlight-file-name nil
     spaceline-all-the-icons-icon-set-git-ahead (quote commit))
   :config
     (spaceline-toggle-all-the-icons-buffer-size-off)
     (spaceline-all-the-icons-theme))
)

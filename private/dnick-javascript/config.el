;;; config.el --- dnick-javascript layer config file for Spacemacs.
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;; License: GPLv3
;;; Code:


;;; config.el ends here


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

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
   '("~/Dropbox/org/projects/job.org" "~/Dropbox/org/inbox.org" "~/Dropbox/org/work.org" "~/Dropbox/org/home.org")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)

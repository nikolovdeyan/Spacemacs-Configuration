;;; packages.el --- dnick-smartparens layer packages file for Spacemacs.
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;; License: GPLv3
;;; Code:
(defconst dnick-python-packages
  '(python pyvenv smartparens) "The list of Lisp packages required by the dnick-smartparens layer.")

(defun dnick-python/post-init-python ()
  (use-package python
    :defer t
    :config
     (add-hook 'python-mode-hook (lambda ()
                               (setq flycheck-checker 'python-pylint
                                     flycheck-checker-error-threshold 900
                                     flycheck-pylintrc "~/.pylintrc"
									 )))
	))

;;; packages.el ends here
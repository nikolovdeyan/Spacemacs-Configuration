;;; packages.el --- dnick-smartparens layer packages file for Spacemacs.
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;; License: GPLv3
;;; Code:
(defconst dnick-python-packages
  '(python) "The list of Lisp packages required by the dnick-smartparens layer.")

(defun dnick-python/post-init-python ()
  (use-package python
    :defer t
    :config
     (add-hook 'python-mode-hook (lambda ()
                               (setq flycheck-checker 'python-flake8
                                     flycheck-checker-error-threshold 500
                                     flycheck-pylintrc "~/.pylintrc"
									 )))
	))

;;; packages.el ends here

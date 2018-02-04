;;; funcs.el --- dnick-org layer functions file for Spacemacs.
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;; License: GPLv3
;;; Code:

(defun org-current-is-todo ()
  (string= "TODO" (org-get-todo-state))
)
;;; funcs.el ends here
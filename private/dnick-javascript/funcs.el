;;; funcs.el --- dnick-javascript layer functions file for Spacemacs.
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;; License: GPLv3
;;; Code:

;;; funcs.el ends here
(defun highlight-operators-js()
  (font-lock-add-keywords
   nil '(("[=<>]" . font-lock-operator-face))
   t))

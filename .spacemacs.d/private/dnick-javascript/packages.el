;;; packages.el --- dnick-javascript layer packages file for Spacemacs.
;;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;; License: GPLv3
;;; Code:

(defconst dnick-javascript-packages '(
	js2-mode))

(defun dnick-javascript/setup-javascript ()

)
	
  
	
(defun dnick-javascript/init-javascript ()
    (use-package javascript
      :defer t
      :init
      :config
       (progn
        (dnick-javascript/setup-javascript)
       )
	)
)
;;; packages.el ends here
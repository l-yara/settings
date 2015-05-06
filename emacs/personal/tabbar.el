;;; tabbar.el -- common init for tabbar operations
;;;
;;; Commentary:

;;; Code:
(prelude-ensure-module-deps '(tabbar))

(require 'tabbar)
(tabbar-mode t)
(defun tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
This function is a custom function for tabbar-mode's tabbar-buffer-groups.
This function group all buffers into 3 groups:
Those Dired, those user buffer, and those emacs buffer.
Emacs buffer are those starting with “*”."
  (list
   (cond
    ((and (> (length (buffer-name)) 7) (string-equal "*eshell" (substring (buffer-name) 0 7)))
     "eshell"
     )
    ((string-equal "*" (substring (buffer-name) 0 1))
     "Emacs Buffer"
     )
    ((eq major-mode 'dired-mode)
     "Dired"
     )
    ((eq major-mode 'scala-mode)
     "Scala"
     )
    (t
     "User Buffer"
     )
    )))
(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)
;;
(global-set-key (kbd "M-}") 'tabbar-forward)
(global-set-key (kbd "C-<next>") 'tabbar-forward)
(global-set-key (kbd "M-{") 'tabbar-backward)
(global-set-key (kbd "C-<prior>") 'tabbar-backward)

(provide 'tabbar)

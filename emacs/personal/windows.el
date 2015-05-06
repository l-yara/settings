;;; windows.el -- windows-specific settings
;;;
;;; Commentary:
;;; Set the left(right)-window keys to do something useful
;;; Code:
;; setting the PC keyboard's various keys to Super or Hyper
(if (equal system-type 'windows-nt)
    (setq w32-pass-lwindow-to-system nil
          w32-pass-rwindow-to-system nil
          w32-pass-apps-to-system nil
          w32-lwindow-modifier 'super ;; Left Windows key
          w32-rwindow-modifier 'super ;; Right Windows key
          w32-apps-modifier 'hyper) ;; Menu key
)

(provide 'windows)
;;; windows.el ends here

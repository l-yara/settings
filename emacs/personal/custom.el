;;; custom.el -- is being loaded by prelude _before_ any other personal module
;;;
;;; Commentary:

;;; Code:

;;Code
;; require package:
;; (prelude-require-packages '(some-package some-other-package))

(prelude-require-packages '(ergoemacs-mode))
(ergoemacs-ignore-prev-global) ; Do not honor previously defined global keys.
;; (require 'ergoemacs-mode)

(setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
(setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout

(ergoemacs-mode 1)


(provide 'custom)
;;; custom.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(delete-selection-mode t)
 '(global-linum-mode t)
 '(org-CUA-compatible nil)
 '(org-replace-disputed-keys nil)
 '(recentf-mode t)
 '(shift-select-mode nil)
 '(size-indication-mode t)
 '(text-mode-hook (quote (turn-off-auto-fill abbrev-mode er/add-text-mode-expansions prelude-enable-whitespace prelude-enable-flyspell text-mode-hook-identify)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

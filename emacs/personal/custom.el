;;; custom.el -- is being loaded by prelude _before_ any other personal module
;;;
;;; Commentary:

;;; Code:

;;Code
;; require package:
;; (prelude-require-packages '(some-package some-other-package))

;; disable magit warning on each load
(setq magit-last-seen-setup-instructions "1.4.0")

(provide 'custom)
;;; custom.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(cua-enable-cua-keys nil)
 '(cua-mode t nil (cua-base))
 '(delete-selection-mode t)
 '(global-linum-mode t)
 '(org-replace-disputed-keys nil)
 '(org-CUA-compatible nil)
 '(recentf-mode t)
 '(shift-select-mode nil)
 '(size-indication-mode t)
 '(text-mode-hook
   (quote
    (turn-off-auto-fill abbrev-mode er/add-text-mode-expansions prelude-enable-whitespace prelude-enable-flyspell text-mode-hook-identify)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

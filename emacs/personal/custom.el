;;; custom.el -- is being loaded by prelude _before_ any other personal module
;;;
;;; Commentary:

;;; Code:

;;Code
;; require package:
;; (prelude-require-packages '(some-package some-other-package))
;; full prelude git: https://github.com/bbatsov/prelude.git

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
 '(package-selected-packages
   (quote
    (adoc-mode markdown-mode+ markdown-mode goto-last-change tabbar rainbow-mode elisp-slime-nav rainbow-delimiters company counsel swiper ivy exec-path-from-shell zop-to-char zenburn-theme which-key volatile-highlights undo-tree super-save smartrep smartparens operate-on-number move-text magit projectile imenu-anywhere hl-todo guru-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region epl editorconfig easy-kill diminish diff-hl discover-my-major crux browse-kill-ring beacon anzu ace-window)))
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

;;; zzz.el -- is being loaded by prelude after everything else
;;;
;;; Commentary:

;;; Code:

;;Code
;; require package:
;; (prelude-require-packages '(some-package some-other-package))

(global-set-key (kbd "C-d") 'prelude-kill-whole-line)
(global-set-key (kbd "<f9>d") 'prelude-duplicate-current-line-or-region)
(global-set-key (kbd "<C-tab>") 'hippie-expand) ;auto-complete word
(global-set-key (kbd "M-/") 'hippie-expand) ;auto-complete word

;; Bastardised version from
;; http://endlessparentheses.com/implementing-comment-line.html and
;; https://github.com/kaushalmodi/.emacs.d/blob/13bc1313e786ce1f1ab41d5aaff3dc39dfc57852/setup-files/setup-editing.el#L110-117
(defun comment-dwim-lines-or-region (n)
  "Comment or uncomment current line or active region and leave point after it.
With positive prefix, apply to N lines including current one.
With negative prefix, apply to -N lines above."
  (interactive "p")
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (goto-char (line-end-position n))))
  (forward-line 1)
  (back-to-indentation))
;; comment whole line: M-7 M-; (select-current-line + comment-swim)
(global-set-key (kbd "M-;") #'comment-dwim-lines-or-region)

;; (load-theme 'solarized-dark t)
;; (disable-theme 'zenburn)


;; (setq whitespace-style '(face tabs empty trailing lines-tail))
(setq whitespace-style (delq 'lines-tail whitespace-style))

;; arrangements
(defun arrange-class ()
  "Arrange window for class - Latex."
  (interactive)
  (arrange-frame 100 40 10 10))

(defun arrange-center ()
  "Arrange window for shell operation."
  (interactive)
  (arrange-frame 170 40 5 1))

(defun arrange-frame (w h x y)
  "Set the (W)idth, (H)eight, and X/Y position of the current frame."
  (interactive "p")
  (let ((frame (selected-frame)))
    (set-frame-position frame x y)
    (set-frame-height (selected-frame) h)
    (set-frame-width (selected-frame) w)))

(global-set-key (kbd "<f9>p") 'arrange-class)
(global-set-key (kbd "<f9>i") 'arrange-center)
(global-set-key (kbd "<f7>") 'recentf-open-files)

(global-set-key (kbd "<f9>e") 'eval-last-sexp)

;; set line wrapping
(defun enable-visual-line-mode ()
 "Enables visual line mode."
  (interactive) (unless visual-line-mode (visual-line-mode 1)) (message "Visual-Line mode enabled"))
(global-set-key (kbd "<f9>w") 'enable-visual-line-mode)

;;go to last edit point
(prelude-ensure-module-deps '(goto-last-change))

(require 'goto-last-change)
(global-set-key  (kbd "C-q") 'goto-last-change)

(define-key isearch-mode-map (kbd "<down>") 'isearch-repeat-forward) ; page down key
(define-key isearch-mode-map (kbd "<up>") 'isearch-repeat-backward) ; page up key




;;Switch OFF auto-fill
(setq auto-fill-mode -1)
(setq-default fill-column 99999)
(setq fill-column 99999)

(setq prelude-guru nil)

;;I do need the menu!
(menu-bar-mode 1)

(provide 'zzz)
;;; zzz.el ends here

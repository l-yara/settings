;;; clojure.el -- initialising clojure editing
;;;
;;; Commentary:

;;; Code:

;;Code
(require 'prelude-clojure)

(add-hook 'nrepl-mode-hook 'paredit-mode)

(provide 'clojure)
;;; clojure.el ends here

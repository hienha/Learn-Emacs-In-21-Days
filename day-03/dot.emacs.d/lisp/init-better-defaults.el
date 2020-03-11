;; inhibit ring bell
(setq ring-bell-function 'ignore)

;; show line number
(global-linum-mode t)

;; selection delete
(delete-selection-mode t)

;; Auto-load file
(global-auto-revert-mode t)

;; no auto-backup and auto-save
(setq make-backup-files nil)
(setq auto-save-default nil)

;; show smarter parentheses
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; recentf-mode
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 50)

;; abbrev-mode
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
					    ("vct" "vincent")
					    ;; emacs regex
					    ))


(provide 'init-better-defaults)


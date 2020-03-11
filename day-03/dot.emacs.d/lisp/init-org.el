(require 'org)

;; highlight source code in in org-mode
(setq org-src-fontify-natively t)

;; org-agenda
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)


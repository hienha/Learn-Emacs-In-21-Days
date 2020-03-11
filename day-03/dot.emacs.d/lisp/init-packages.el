(require 'cl)

(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("gnu-tuna"    .  "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			   ("melpa-tuna"  .  "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))

;; add whatever package you want here
(defvar vincent/packages '(
			   company
			   dracula-theme
			   monokai-theme
			   hungry-delete
			   counsel
			   swiper
			   smartparens
			   exec-path-from-shell
			   js2-mode
			   nodejs-repl
			   popwin
			   ) "Default packages")
(setq package-selected-packages vincent/packages)

(defun vincent/packages-installed-p ()
  (loop for pkg in vincent/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (vincent/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg vincent/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;;;;;;;;; customize settings ;;;;;;;
;; if your OS is MacOXX, you need add below settings.
(when (memq window-system '(mac ns))
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize))

(global-company-mode t)

;; Popwin mode
(require 'popwin)
(popwin-mode t)

;; hungry-delete mode
(require 'hungry-delete)
(global-hungry-delete-mode)

;; ivy-mode
(ivy-mode t)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(smartparens-global-mode t)

;; Configure js2-mode for js files.
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(provide 'init-packages)

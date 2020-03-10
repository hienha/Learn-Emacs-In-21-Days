;; MELPA Tuna mirror
;; TUNA official settings;
;; (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
;; (package-initialize) ;; You might already have this line
;;
;; Customize settings
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  ;; (add-to-list 'package-archives '(("gnu-tuna" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
  ;;				   ("melpa-tuna" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))
  (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			   ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))

;; load common lisp libs.
(require 'cl)

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

;; hungry-delete mode
(require 'hungry-delete)
(global-hungry-delete-mode)

;; configure for smex
;; (require 'smex) ; Not needed if you use package.el
;; (smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                    ; when Smex is auto-initialized on its first run.
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; configure for swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; configure for smartparens
(require 'smartparens-config)
;; You can now use smartparens with M-x smartparens-mode. To automatically enable smartparens in a programming mode:
;; Always start smartparens mode in js-mode.
;; (add-hook 'js-mode-hook #'smartparens-mode)
;; (add-hook 'emacs-lisp-mode-hook #'smartparens-mode)
;; All buffers used smartparens
(smartparens-global-mode t)

;; configure js2-mode for js files.
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; is your's OS is MacOSX, you need add below settings
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; agenda files and agenda view
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; turn off tool bar, menu bar, scroll bar
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;; turn on electric-indent-mode, default is true.
;; NOTICE: Recommand to open this feature.
;; (electric-indent-mode 0)

; display line number
(global-linum-mode t)

; turn off splash screen
(setq inhibit-splash-screen t)

; custome to open my init.el file
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-my-init-file)

; global company mode
(global-company-mode t)

;; set cursor type
(setq-default cursor-type 'bar)

; disable backup files
(setq make-backup-files nil)

;; let's your source code looks better in org-mode.
(require 'org)
(setq org-src-fontify-natively t)

;; setting recentf-mode
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 35)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; set delete-selection-mode, you can select an are and use DEL to delete it.
(delete-selection-mode t)

;; full-screen mode
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; show match parenthese
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; highlight current line
(global-hl-line-mode t)

;; load theme Dracula
(load-theme 'dracula t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("55c2069e99ea18e4751bd5331b245a2752a808e91e09ccec16eb25dadbe06354" default)))
 '(package-selected-packages (quote (company))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "dark gray")))))

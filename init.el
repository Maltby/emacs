;; Use-package setup
(package-initialize)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)

;; Packages
(use-package projectile
	     :config
	     (projectile-mode)
	     (setq projectile-require-root-project nil))

(use-package helm
	     :config
	     (recentf-mode 1)
	     (setq helm-mode-fuzzy-match t)
	     (setq helm-completion-in-region-fuzzy-match t)
	     (setq helm-candidate-number-limit 100)
	     (setq helm-M-x-fuzzy-match t)
	     :bind (("M-x" . helm-M-x)
		    ("C-x C-f" . helm-find-files)))

(use-package helm-projectile
	     :config
	     (helm-projectile-on)
	     :bind (("C-c p f" . helm-projectile-find-file)
		    ("C-c p s" . helm-projectile-ag)))

(use-package exec-path-from-shell
	     :config (exec-path-from-shell-initialize))

(use-package evil
	     :config
	     (evil-mode))

(use-package helm-ag)

(use-package magit)

(use-package tide)

;; UI / UX
(load-theme 'grandshell t)
(set-face-attribute 'default nil :height 110)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(show-paren-mode t)
(global-hl-line-mode +1)
(set-face-background 'hl-line "#4A4A4A")
(setq evil-insert-state-cursor '(box "#00CE7E")
      evil-normal-state-cursor '(box "#F7FF57")
      evil-visual-state-cursor '(box "red")
      evil-replace-state-cursor '(box "blue")
      )
(setq fill-column 80)
(setq visible-bell nil)
(setq indent-tabs-mode nil)
(setq mouse-autoselect-window t)
(setq mouse-drag-copy-region nil)
(global-unset-key [mouse-2])
(setq mouse-wheel-follow-mouse t)
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1)))
(setq js-indent-level 2)

;; Disable graphical dialog boxes
(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent 'yes-or-no-p' from activating a dialog."
  (let ((use-dialog-box nil))
    ad-do-it))
(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent 'y-or-n-p' from activating a dialog."
  (let ((use-dialog-box nil))
    ad-do-it))

;; Motion
(global-set-key (kbd "C-c h")  'windmove-left)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c k")    'windmove-up)
(global-set-key (kbd "C-c j")  'windmove-down)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (tide use-package magit helm-projectile helm-ag grandshell-theme exec-path-from-shell evil-leader))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

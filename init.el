(require 'package)

;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;; Use-package setup
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
;; don't load packages with 'package ?
(setq package-enable-at-startup nil)
(require 'use-package)
(require 'org)
(org-babel-load-file
 (expand-file-name "main.org"
		   user-emacs-directory))

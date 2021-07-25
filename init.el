;; Use-package setup
(setq package-archives '(
        ("melpa" . "http://melpa.org/packages/")
))

;; Manual package-initialize
(require 'package)
(package-initialize)

;; Install if missing
(unless (package-installed-p 'use-package)
	(package-install 'use-package))
(unless (package-installed-p 'org)
	(package-install 'org))

;; Load main.org
(org-babel-load-file
 (expand-file-name "main.org"
		   user-emacs-directory))

; .config/emacs/init.el
; M-x check-parens to check for mismatched parens. Enabling show-paren mode helps too.
(package-initialize)

(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("org" . "https://orgmode.org/elpa/") t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (idea-darkula-mw)))
 '(custom-safe-themes
   (quote
    ("b8c540fe258780c3aabd79affb9c0b7d560c46b372c90abb756432a4c872f8dc" "b0936731f7add7716dbeff87b60821d6719e3afa1ceeab66c016246c2ead60c6" "420689cc31d01fe04b8e3adef87b8838ff52faa169e69ca4e863143ae9f3a9f9" default)))
 '(helm-mode t)
 '(menu-bar-mode nil)
 '(package-user-dir "~/lib/elpa")
 '(package-archive-priorities (quote (("melpa" . 6) ("org" . 10))))
 '(package-selected-packages (quote (use-package elisp-refs spaceline idea-darkula-mw-theme w3 all-the-icons spaceline spaceline-all-the-icons)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2B2B2B" :foreground "#A9B7C6" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "source-foundry" :family "Fira Code")))))

;;for debugging
;; (setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
;;                         ("melpa" . "https://melpa.org/packages/"))

(package-install-selected-packages)

;; (dolist (package '(use-package))
;; ;;(dolist (package package-selected-packages)
;;    (unless (package-installed-p package)
;;      (package-install package)))

(setq use-package-always-ensure t)

;(use-package helm
;  :config (helm-mode 1)
;  :bind (("M-x" . helm-M-x)
;         ("C-x C-f" . helm-find-files)))

(use-package all-the-icons
  :if window-system
  :config
  (when (not (member "all-the-icons" (font-family-list)))
    (all-the-icons-install-fonts t)))

(use-package treemacs
  :after all-the-icons
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag))
  :config
  (add-hook 'treemacs-mode-hook (lambda () (treemacs-resize-icons 16)))
 )

(use-package spaceline
  :config
  (setq-default mode-line-format '("%e" (:eval (spaceline-ml-main)))))

(use-package spaceline-all-the-icons)

(use-package spaceline-config
  :after spaceline spaceline-all-the-icons
  :config
  (spaceline-helm-mode 1)
  (spaceline-all-the-icons-theme))



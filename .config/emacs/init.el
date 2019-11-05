(setq debug-on-error 't)

(package-initialize) ;; make sure 'package-archives is defined & pass member check w/o void-variable err

(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

;; Melpa - https://melpa.org/#/getting-started has a more detailed function handling 
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))

(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/"))
    
;; Setup automatic installation of packages on 
;; https://www.reddit.com/r/emacs/comments/4fqu0a/automatically_install_packages_on_startup/
(setq use-package-compute-statistics t
      use-package-always-ensure t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)


;; Helm - partially from emacs-helm.sh
;;mw NB: Just set helm-mode on using Customize for the default experience

(use-package helm
  :init
  (setq helm-flx-for-helm-find-files t)
  :config
  (helm-mode 1)
  (helm-flx-mode 1)
  (define-key global-map [remap find-file] 'helm-find-files)
  (define-key global-map [remap occur] 'helm-occur)
  (define-key global-map [remap list-buffers] 'helm-buffers-list)
  (define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
  (define-key global-map [remap execute-extended-command] 'helm-M-x)
  (define-key global-map [remap apropos-command] 'helm-apropos)
  (unless (boundp 'completion-in-region-function)
    (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
    (define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point))
  )

;; Try Ivy/Swiper/Counsel
;; https://truthseekers.io/lessons/how-to-use-ivy-swiper-counsel-in-emacs-for-noobs/
;; (setq ivy-use-virtual-buffers t)  ;; no idea, but recommended by project maintainer
;; (setq enable-recursive-minibuffers t) ;; no idea, but recommended by project maintainer
;; (setq ivy-count-format "(%d/%d) ")  ;; changes the format of the number of results
;; (ivy-mode 1)
;; (global-set-key (kbd "C-s") 'swiper)  ;; replaces i-search with swiper
;; (global-set-key (kbd "M-x") 'counsel-M-x) ;; Gives M-x command counsel features
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file) ;; gives C-x C-f counsel features
;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;; (global-set-key (kbd "<f1> l") 'counsel-find-library)
;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol) 
;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)  
;; (global-set-key (kbd "C-c C-r") 'ivy-resume) 
 
;; (global-set-key (kbd "C-c g") 'counsel-git)
;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
;; (global-set-key (kbd "C-c k") 'counsel-ag) ;; add counsel/ivy features to ag package
;; (global-set-key (kbd "C-x l") 'counsel-locate)
;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;; ;;(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

;; ;;set action options during execution of counsel-find-file
;; ;; replace "frame" with window to open in new window
;; (ivy-set-actions
;;  'counsel-find-file
;;  '(("j" find-file-other-frame "other frame")
;;    ("b" counsel-find-file-cd-bookmark-action "cd bookmark")
;;    ("x" counsel-find-file-extern "open externally")
;;    ("d" delete-file "delete")
;;    ("r" counsel-find-file-as-root "open as root")))
 
;; ;; set actions when running C-x b
;; ;; replace "frame" with window to open in new window
;; (ivy-set-actions
;;  'ivy-switch-buffer
;;  '(("j" switch-to-buffer-other-frame "other frame")
;;    ("k" kill-buffer "kill")
;;    ("r" ivy--rename-buffer-action "rename")))
;; end Ivy
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; from https://stackoverflow.com/questions/13397737/ansi-coloring-in-compilation-mode
;; (use-package ansi-color)

(defun my-colorize-compilation-buffer ()
  (when (eq major-mode 'compilation-mode)
    (ansi-color-apply-on-region compilation-filter-start (point-max))))
(add-hook 'compilation-filter-hook 'my-colorize-compilation-buffer)

;; from https://www.emacswiki.org/emacs/AnsiColor
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(when (memq window-system '(mac ns x))
   (exec-path-from-shell-initialize))

(use-package all-the-icons)
;;  :config
;;  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

; (use-package powerline)
; (powerline-default-theme)

(use-package spaceline)
;; (spaceline-emacs-theme)
;; (spaceline-spacemacs-theme)
(use-package spaceline-all-the-icons
  :after spaceline
  :init (spaceline-all-the-icons-theme))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs Java developer tools
;;
;; Eclim
;; from http://www.goldsborough.me/emacs,/java/2016/02/24/22-54-16-setting_up_emacs_for_java_development/
;; (require 'eclim)
;; (add-hook 'java-mode-hook 'eclim-mode)
;; (require 'eclimd)

;; Language Server Protocol
(use-package lsp-mode
  :hook (java-mode . lsp-deferred)
  :commands (lsp lsp-deferred))

;; Eclipse JDT LSP Server
;; https://github.com/emacs-lsp/lsp-java
(use-package lsp-java
  :config
  (add-hook 'java-mode-hook #'lsp-deferred))

;; intellij-lsp-server
;; from https://github.com/Ruin0x11/lsp-intellij
;; (with-eval-after-load 'lsp-mode
;;  (require 'lsp-intellij)
;;  (add-hook 'java-mode-hook #'lsp-intellij-enable))

(use-package company-lsp
   :config
   (push 'company-lsp company-backends))

(use-package flycheck)
(use-package lsp-ui
   :config (progn
	     (add-hook 'lsp-mode-hook 'lsp-ui-mode)
	     (add-hook 'java-mode-hook 'flycheck-mode)))

(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)

;; This isn't available in melpa/elpa and so I've stashed it locally 2019-10. Update when it's there.
;; Spring Boot helper
(load-library "lsp-java-boot")

;; to enable the lenses
(with-eval-after-load 'lsp-java-boot
  (add-hook 'lsp-mode-hook #'lsp-lens-mode)
  (add-hook 'java-mode-hook #'lsp-java-boot-lens-mode))

(defun sqlparse-region (beg end)
  (interactive "r")
  (shell-command-on-region
   beg end
   "python -c 'import sys, sqlparse; print(sqlparse.format(sys.stdin.read(), reindent=True))'"
   t t))

;; http://ergoemacs.org/emacs/emacs_customize_default_window_size.html
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 140) ; chars
              (height . 60) ; lines
              (left . 750)
              (top . 0)))
      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 140)
              (height . 60)
              (left . 750)
              (top . 0)))))

(use-package magit)

(use-package magit-find-file
  :bind (:map global-map ("C-c p" .  'magit-find-file-completing-read)))

;;  (progn
;;    (setq initial-frame-alist '( (tool-bar-lines . 0)))
;;    (setq default-frame-alist '( (tool-bar-lines . 0)))))

;;(use-package hide-mode-line) ;;mw not doing anything special here

;; Improve treemacs icons - https://blog.jft.rocks/emacs/treemacs-icons.html
;; Make sure (eg. with 
(defun treemacs-improve-all-the-icons ()
    (let ((all-the-icons-default-adjust 0)
	  (tab-width 1))
      ;; Root icon
      (setq treemacs-icon-root-png
	    (concat (all-the-icons-octicon "repo" :height 0.8 :v-adjust -0.2)  " "))
      ;; File icons
      (setq treemacs-icon-open-png
	    (concat
	     (all-the-icons-octicon "chevron-down" :height 0.8 :v-adjust 0.1) "\t"
	     (all-the-icons-octicon "file-directory" :v-adjust 0) "\t")
	    treemacs-icon-closed-png
	    (concat
	     (all-the-icons-octicon "chevron-right" :height 0.8
				    :v-adjust 0.1 :face 'font-lock-doc-face)
	     "\t"
	     (all-the-icons-octicon "file-directory" :v-adjust 0 :face 'font-lock-doc-face) "\t"))
   ;; File type icons
      (setq treemacs-icons-hash (make-hash-table :size 200 :test #'equal)
	    treemacs-icon-fallback (concat
				    "\t\t"
				    (all-the-icons-faicon "file-o" :face 'all-the-icons-dsilver
 							  :height 0.8 :v-adjust 0.0)
				    "\t")
	    treemacs-icon-text treemacs-icon-fallback)
      
      (dolist (item all-the-icons-icon-alist)
	(let* ((extension (car item))
	       (func (cadr item))
	       (args (append (list (caddr item)) '(:v-adjust -0.05) (cdddr item)))
	       (icon (apply func args))
	       (key (s-replace-all '(("^" . "") ("\\" . "") ("$" . "") ("." . "")) extension))
	       (value (concat "\t\t" icon "\t")))
	  (unless (ht-get treemacs-icons-hash (s-replace-regexp "\\?" "" key))
	    (ht-set! treemacs-icons-hash (s-replace-regexp "\\?" "" key) value))
	  (unless (ht-get treemacs-icons-hash (s-replace-regexp ".\\?" "" key))
	    (ht-set! treemacs-icons-hash (s-replace-regexp ".\\?" "" key) value))))))

;; Treemacs
;; 
(use-package treemacs
  :bind
  (:map global-map
	("M-0"       . treemacs-select-window)
	("C-x t 1"   . treemacs-delete-other-windows)
	("C-x t t"   . treemacs)
	("C-x t C-t" . treemacs-find-file)
	("C-x t B"   . treemacs-bookmark)
	("C-x t M-t" . treemacs-find-tag))
  :config
  (add-hook 'treemacs-mode-hook (lambda () (treemacs-resize-icons  16)))
  )

;;   :after all-the-icons projectile hide-mode-line
;;   :init
;;   (setq treemacs-width 30
;; 	treemacs--icon-size 16
;; 	treemacs-display-in-side-window t
;; 	treemacs-indentation-string (propertize " " 'face 'font-lock-comment-face)
;; 	treemacs-indentation 1)
;;   ;;mw defaults? See https://github.com/Alexander-Miller/treemacs
;;   ;; :bind
;;   ;; (:map global-map
;;   ;;       ("M-0"       . treemacs-select-window)
;;   ;;       ("C-x t 1"   . treemacs-delete-other-windows)
;;   ;;       ("C-x t t"   . treemacs)
;;   ;;       ("C-x t C-t" . treemacs-find-file)
;;   ;;       ("C-x t B"   . treemacs-bookmark)
;;   ;;       ("C-x t M-t" . treemacs-find-tag))
;;   :config
;;     (treemacs-follow-mode t)
;;     (add-hook 'treemacs-mode-hook #'hide-mode-line-mode)
;;     (add-hook 'treemacs-mode-hook (lambda () (treemacs-resize-icons  16)))
;;     (add-hook 'treemacs-mode-hook (lambda ()
;; 				    (linum-mode -1)
;; 				    (fringe-mode 0)
;; 				    (setq buffer-face-mode-face `(:background "#211C1C"))
;; 				    (buffer-face-mode 1)))
    

;; ;; Improve treemacs icons - https://blog.jft.rocks/emacs/treemacs-icons.html
;; ;;    (with-eval-after-load 'all-the-icons
;; ;;      (with-eval-after-load 'treemacs
;; ;;	; Move complexity into a defun
;; ;;	(treemacs-improve-all-the-icons)))

;; )
    
(use-package treemacs-magit
  :after treemacs magit)

(use-package treemacs-projectile)

(use-package doom-themes
  :after treemacs
  :disabled
  :config 
     ;; from https://github.com/hlissner/emacs-doom-themes
    (setq doom-themes-treemacs-theme "doom-atom") ; use the colorful treemacs theme
    (doom-themes-treemacs-config)
     ;; Corrects (and improves) org-mode's native fontification.
    (doom-themes-org-config)
    )

(use-package elisp-refs
  :commands (elisp-refs-function elisp-refs-macro elisp-refs-variable
             elisp-refs-special elisp-refs-symbol)
  :bind (:map lisp-mode-shared-map
	      ("M-<f7>"   . elisp-refs-function))) ; like IntelliJ

(use-package projectile
  :ensure t
  :config
  ;;mw Don't have a "Super" key defined on my mac (yet, 2019-10)
  ;; (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

;; https://www.emacswiki.org/emacs/Desktop
(setq desktop-buffers-not-to-save
        (concat "\\("
                "^nn\\.a[0-9]+\\|\\.log\\|(ftp)\\|^tags\\|^TAGS"
                "\\|\\.emacs.*\\|\\.diary\\|\\.newsrc-dribble\\|\\.bbdb"
	        "\\)$"))
(setq desktop-modes-not-to-save '(dired-mode tags-table-mode dired-mode Info-mode treemacs-mode info-lookup-mode fundamental-mode))
;; (add-to-list 'desktop-modes-not-to-save 'Info-mode)
;; (add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
;; (add-to-list 'desktop-modes-not-to-save 'fundamental-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (idea-darkula-mw)))
 '(custom-safe-themes
   (quote
    ("b8c540fe258780c3aabd79affb9c0b7d560c46b372c90abb756432a4c872f8dc" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "2d1fe7c9007a5b76cea4395b0fc664d0c1cfd34bb4f1860300347cdad67fb2f9" "f30aded97e67a487d30f38a1ac48eddb49fdb06ac01ebeaff39439997cbdd869" "420689cc31d01fe04b8e3adef87b8838ff52faa169e69ca4e863143ae9f3a9f9" default)))
 '(desktop-save-mode t)
 '(fci-rule-color "#5B6268")
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f"))))
 '(ivy-mode nil)
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(lsp-enable-file-watchers nil)
 '(lsp-java-workspace-dir "/Users/mwarren/workspace/")
 '(objed-cursor-color "#ff6c6b")
 '(package-selected-packages
   (quote
    (ecb magit-find-file treemacs-magit all-the-icons-dired elisp-refs treemacs-projectile hide-mode-line lsp-mode spaceline-all-the-icons all-the-icons doom-themes lsp-java-boot spaceline powerline-evil flycheck lsp-java which-key use-package request powerline lsp-ui idea-darkula-theme hydra exec-path-from-shell evil-unimpaired evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help elisp-slime-nav eclim dumb-jump diminish define-word company-lsp column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(pdf-view-midnight-colors (quote ("#b2b2b2" . "#292b2e")))
 '(spaceline-all-the-icons-icon-set-window-numbering (quote square))
 '(tool-bar-style (quote text))
 '(vc-annotate-background "#282c34")
 '(vc-annotate-color-map
   (list
    (cons 20 "#98be65")
    (cons 40 "#b4be6c")
    (cons 60 "#d0be73")
    (cons 80 "#ECBE7B")
    (cons 100 "#e6ab6a")
    (cons 120 "#e09859")
    (cons 140 "#da8548")
    (cons 160 "#d38079")
    (cons 180 "#cc7cab")
    (cons 200 "#c678dd")
    (cons 220 "#d974b7")
    (cons 240 "#ec7091")
    (cons 260 "#ff6c6b")
    (cons 280 "#cf6162")
    (cons 300 "#9f585a")
    (cons 320 "#6f4e52")
    (cons 340 "#5B6268")
    (cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil)
 '(which-key-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(which-key-setup-side-window-right-bottom)

(server-start)


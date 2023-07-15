;; Debugging helpers
;; (setq debug-on-error 't)
;; (check-parens)

;; Benchmarking Suggestions
;; http://qsdfgh.com/articles/2016/11/02/emacs-loading-time.html
;; Display the total loading time in the minibuffer
;; (defun display-startup-echo-area-message ()
;;   "Display startup echo area message."
;;   (message "Initialized in %s" (emacs-init-time)))
;; ;; Benchmark loading time file by file and display it in the *Messages* buffer
;; (when init-file-debug
;;   (require 'benchmark))

;; (if init-file-debug
;;     (message "Feature '%s' loaded in %.2fs" feat
;; 	     (benchmark-elapse (require feat fname))))

;; alternate
;;  https://emacs.stackexchange.com/questions/539/how-do-i-measure-performance-of-elisp-code
;; (defmacro with-timer (title &rest forms)
;;   "Run the given FORMS, counting the elapsed time.
;; A message including the given TITLE and the corresponding elapsed
;; time is displayed."
;;   (declare (indent 1))
;;   (let ((nowvar (make-symbol "now"))
;;         (body   `(progn ,@forms)))
;;     `(let ((,nowvar (current-time)))
;;        (message "%s..." ,title)
;;        (prog1 ,body
;;          (let ((elapsed
;;                 (float-time (time-subtract (current-time) ,nowvar))))
;;            (message "%s... done (%.3fs)" ,title elapsed))))))
;; Example use:
;; (with-timer "Doing things"
;;  (form (to (be evaluated))))

;; Best profiling!
;; emacs -Q -l ~/.config/emacs/elisp/profile-dotemacs.el -f profile-dotemacs


;; 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Info-default-directory-list
   '("\"%emacs_dir%/share/info/\" \"c:/Program Files/emacs/x86_64/share/info\" \"c:/Program Files/emacs/share/info\""))
 '(Man-notify-method 'pushy)
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(blink-cursor-mode nil)
 '(cfw:fchar-horizontal-line 9472)
 '(cfw:fchar-junction 9532)
 '(cfw:fchar-left-junction 9500)
 '(cfw:fchar-right-junction 9508)
 '(cfw:fchar-top-junction 9516)
 '(cfw:fchar-top-left-corner 9581)
 '(cfw:fchar-top-right-corner 9582)
 '(cfw:fchar-vertical-line 9474)
 '(custom-enabled-themes '(idea-darkula-mw))
 '(custom-safe-themes
   '("108ea265779bcdc457d04ecef23ba6c67f531235aa1a45c69db8f37ba569cd3d" "f2b83b9388b1a57f6286153130ee704243870d40ae9ec931d0a1798a5a916e76" "a2286409934b11f2f3b7d89b1eaebb965fd63bc1e0be1c159c02e396afb893c8" "b8c540fe258780c3aabd79affb9c0b7d560c46b372c90abb756432a4c872f8dc" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "2d1fe7c9007a5b76cea4395b0fc664d0c1cfd34bb4f1860300347cdad67fb2f9" "f30aded97e67a487d30f38a1ac48eddb49fdb06ac01ebeaff39439997cbdd869" "420689cc31d01fe04b8e3adef87b8838ff52faa169e69ca4e863143ae9f3a9f9" default))
 '(datetime-timezone 'America/Los_Angeles)
 '(desktop-modes-not-to-save
   '(tags-table-mode dired-mode Info-mode treemacs-mode info-lookup-mode fundamental-mode))
 '(desktop-save-mode t)
 '(display-time-format "%I:%M")
 '(ecb-options-version "2.50")
 '(ecb-source-path
   '(("/Users/mwarren/Projects/ledp" "ledp")
	 ("/Users/mwarren/Projects/leui" "leui")
	 ("/Users/mwarren/Projects/emacs/mituharu-emacs-mac-3bf213d502a8" "emacs")))
 '(fci-rule-color "#5B6268")
 '(gnus-secondary-select-methods '((nnreddit "")))
 '(grep-command "pcregrep  -Hin ")
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
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
	 ("\\?\\?\\?+" . "#dc752f")))
 '(ivy-mode nil)
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(logview-additional-timestamp-formats
   '(("LElogs"
	  (java-pattern . "yyyy-MM-dd'T'HH:mm:ss,SSS'Z'"))))
 '(lsp-enable-file-watchers nil)
 '(lsp-java-server-install-dir "~/lib/eclipse.jdt.ls/server/")
 '(lsp-java-workspace-dir "/Users/mwarren/workspace/")
 '(objed-cursor-color "#ff6c6b")
 '(package-check-signature t)
 '(package-selected-packages
   '(gnu-elpa-keyring-update url-http-ntlm powershell calfw-cal vlf calfw-gcal nnreddit sql calfw advice-patch outline-magic flymake logview scala-mode ecb magit-find-file treemacs-magit all-the-icons-dired elisp-refs treemacs-projectile hide-mode-line lsp-mode spaceline-all-the-icons all-the-icons spaceline flycheck lsp-java which-key use-package request powerline lsp-ui idea-darkula-theme hydra exec-path-from-shell eval-sexp-fu eshell-z eshell-prompt-extras esh-help elisp-slime-nav eclim dumb-jump diminish define-word company-lsp column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link))
 '(package-user-dir "~/lib/elpa")
 '(pdf-view-midnight-colors '("#b2b2b2" . "#292b2e"))
 '(spaceline-all-the-icons-icon-set-window-numbering 'square)
 '(spaceline-all-the-icons-separator-type 'arrow)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(tool-bar-style 'text)
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
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "outline" :family "Fira Code Retina"))))
 '(Man-overstrike ((t (:inherit bold :foreground "orange"))))
 '(Man-underline ((t (:inherit underline :foreground "medium spring green"))))
 '(cfw:face-toolbar-button-off ((t (:foreground "Gray40" :weight bold))))
 '(company-preview-search ((t (:inherit isearch :box nil))))
 '(hl-line ((t (:background "dark olive green"))))
 '(log4j-font-lock-debug-face ((t (:foreground "salmon"))))
 '(log4j-font-lock-info-face ((t (:foreground "medium spring green"))))
 '(logview-information-entry ((t (:background "#002500"))))
 '(parenthesis ((t (:inherit shadow :foreground "dim gray")))))


(package-initialize) ;; make sure 'package-archives is defined to pass member check w/o void-variable err

;; Melpa - https://melpa.org/#/getting-started with a detailed function handling httpS
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
             '("org" . "https://orgmode.org/elpa/"))

; Enable all dirs from .config/emacs/elisp
(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))
(let ((default-directory  (expand-file-name "elisp" user-emacs-directory)))
  (normal-top-level-add-subdirs-to-load-path))

;; Try to configure automatic installation of packages. Doesn't work very well for unconfigured packages.
;; https://www.reddit.com/r/emacs/comments/4fqu0a/automatically_install_packages_on_startup/
(setq use-package-compute-statistics t
      use-package-always-ensure t)

;; Only install packages if the --install-pkgs command line argument is passed to emacs.
(defun found-custom-arg (switch)
  (let ((found-switch (member switch command-line-args)))
    (setq command-line-args (delete switch command-line-args))
    found-switch))

(if (found-custom-arg "--install-pkgs")
    ;;mw Advise/redefine to show missing packages when difference > 0
    ;; from lisp/elisp/package.el
    (progn
      (unless (package-installed-p 'advice-patch)
	  (package-install 'advice-patch))
      (require 'advice-patch)
      (with-demoted-errors "Error in advice-patch of package-install-selected-packages: %S"
	(advice-patch 'package-install-selected-packages
		       '(message "%d packages are not available (the rest are already installed); maybe you need to `M-x package-refresh-contents'. 
                  Not available: %s" difference (cl-set-difference not-installed available))		    
		      '(message "%s packages are not available (the rest already installed), maybe you need to `M-x package-refresh-contents'"
				difference)))

      ;;mw The package built-in is more full featured than other hand written workarounds.
      (package-refresh-contents)
      (package-install-selected-packages)
      ;; e.g. this is one hand written workaround:
      ;; (unless (package-installed-p 'use-package)
      ;;  (package-refresh-contents)
      ;;  (package-install 'use-package))

      )
  )

(require 'use-package)

;; Helm - partially from emacs-helm.sh
;;mw NB: Just turn on helm-mode using Customize for the default experience
;;mw removed from package-selected packages:  ace-jump-helm-line
;; (add-hook 'helm-mode-hook ()
(use-package helm
  :disabled
  :bind
  ([remap find-file] . 'helm-find-files)
  ([remap occur] . 'helm-occur)
; ([remap list-buffers] . 'helm-buffers-list)
  ([remap dabbrev-expand] . 'helm-dabbrev)
  ([remap execute-extended-command] . 'helm-M-x)
  ([remap apropos-command] . 'helm-apropos)
; https://emacs.stackexchange.com/questions/33727/how-does-spacemacs-allow-tab-completion-in-helm  
  ("TAB" . #'helm-execute-persistent-action)
  ("<tab>" . #'helm-execute-persistent-action)
  ("C-z" . #'helm-select-action)
  :config
  (setq helm-flx-for-helm-find-files t)
  (helm-mode 0)
  (helm-flx-mode 0)
  (unless (boundp 'completion-in-region-function)
    (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
    (define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point)
    )
  )

;; Try Ivy/Swiper/Counsel
;; https://truthseekers.io/lessons/how-to-use-ivy-swiper-counsel-in-emacs-for-noobs/
(use-package ivy
  :disabled
  :bind 
  ("C-s" . swiper)  ;; replaces i-search with swiper
  ("M-x" . counsel-M-x) ;; Gives M-x command counsel features
  ("C-x C-f" . 'counsel-find-file) ;; gives C-x C-f counsel features
  ("<f1> f" . 'counsel-describe-function)
  ("<f1> v" . 'counsel-describe-variable)
  ("<f1> l" . 'counsel-find-library)
  ("<f2> i" . 'counsel-info-lookup-symbol) 
  ("<f2> u" . 'counsel-unicode-char)  
  ("C-c C-r" . 'ivy-resume) 

  ("C-c g" . counsel-git)
  ("C-c j" . counsel-git-grep)
  ("C-c k" . counsel-ag) ;; add counsel/ivy features to ag package
  ("C-x l" . counsel-locate)
  ("C-S-o" . counsel-rhythmbox)
  ;;(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

  ;;set action options during execution of counsel-find-file
  ;; replace "frame" with window to open in new window
  :config
  (setq ivy-use-virtual-buffers t)  ;; no idea, but recommended by project maintainer
  (setq enable-recursive-minibuffers t) ;; no idea, but recommended by project maintainer
  (setq ivy-count-format "(%d/%d) ")  ;; changes the format of the number of results
  (ivy-mode 1)
  (ivy-set-actions
   'counsel-find-file
   '(("j" find-file-other-frame "other frame")
     ("b" counsel-find-file-cd-bookmark-action "cd bookmark")
     ("x" counsel-find-file-extern "open externally")
     ("d" delete-file "delete")
     ("r" counsel-find-file-as-root "open as root")))
  
  ;; set actions when running C-x b
  ;; replace "frame" with window to open in new window
  (ivy-set-actions
   'ivy-switch-buffer
   '(("j" switch-to-buffer-other-frame "other frame")
     ("k" kill-buffer "kill")
     ("r" ivy--rename-buffer-action "rename")))
  )  ;; end use-package Ivy


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
  (progn
    ; Better ls. https://emacs.stackexchange.com/questions/29096/how-to-sort-directories-first-in-dired
    (setq insert-directory-program "gls" dired-use-ls-dired t)
    ; for Fira Code font ligatures. https://github.com/tonsky/FiraCode/wiki/Emacs-instructions
    (mac-auto-operator-composition-mode)
    (setq exec-path-from-shell-arguments 'nil)
    (exec-path-from-shell-initialize)
    )
  )

(use-package all-the-icons)
;;  :config
;;  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package powerline
  :config (powerline-default-theme))

(use-package spaceline
  :disabled)
(use-package spaceline-all-the-icons
  :disabled
  :after spaceline
  :config (spaceline-all-the-icons-theme)
  )
;; (spaceline-emacs-theme)
;; (spaceline-spacemacs-theme)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs Java developer tools
;;
;; Eclim
;; from http://www.goldsborough.me/emacs,/java/2016/02/24/22-54-16-setting_up_emacs_for_java_development/
;; (require 'eclim)
;; (add-hook 'java-mode-hook 'eclim-mode)
;; (require 'eclimd)
;;
;; LSP - Language Server Protocol. Newer, lighter weight option using the lsp protocol from Microsoft
(use-package company-lsp
   :defer
   :config
   (push 'company-lsp company-backends))

(use-package flycheck
  :defer
  )

;; Language Server Protocol
(use-package lsp-mode
  :hook (java-mode . lsp-deferred)
  :commands (lsp lsp-deferred))

;; Eclipse JDT LSP Server
;; https://github.com/emacs-lsp/lsp-java
(use-package lsp-java
  :defer
  :config
  (add-hook 'java-mode-hook #'lsp-deferred)
  (add-hook 'java-mode-hook (lambda () (require 'lsp-java-boot)))
  (with-eval-after-load 'lsp-java-boot
    (add-hook 'lsp-mode-hook #'lsp-lens-mode)
    (add-hook 'java-mode-hook #'lsp-java-boot-lens-mode))
  )

;; intellij-lsp-server
;; from https://github.com/Ruin0x11/lsp-intellij
;; (with-eval-after-load 'lsp-mode
;;  (require 'lsp-intellij)
;;  (add-hook 'java-mode-hook #'lsp-intellij-enable))

;; This isn't available in melpa/elpa and so I've stashed it locally 2019-10. Update when it's there.
;; Spring Boot helper
;;mw Moved into java-mode-hook above
;; (require 'lsp-java-boot)
;; ;; to enable the lenses
;; (with-eval-after-load 'lsp-java-boot
;;  (add-hook 'lsp-mode-hook #'lsp-lens-mode)
;;  (add-hook 'java-mode-hook #'lsp-java-boot-lens-mode))


(use-package lsp-ui
  :defer
  :bind (:map lsp-ui-mode-map ([remap xref-find-definitions] . #'lsp-ui-peek-find-definitions)
	      ([remap xref-find-references] . #'lsp-ui-peek-find-references))
  :config (progn
	    (add-hook 'lsp-mode-hook 'lsp-ui-mode)
	    (add-hook 'lsp-mode-hook (lambda () (require 'lsp-ui-flycheck)))
	    (add-hook 'lsp-mode-hook (lambda () (require 'lsp-symbol-outline)))
	    (add-hook 'lsp-after-open-hook (lambda () (lsp-ui-flycheck-enable 1)))
	    (add-hook 'java-mode-hook 'flycheck-mode))
  )
;; moved to :bind above
;;(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
;;(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)

;; Moved into lsp-ui hooks
;; (require 'lsp-ui-flycheck)
;; (with-eval-after-load 'lsp-mode
;;   (add-hook 'lsp-after-open-hook (lambda () (lsp-ui-flycheck-enable 1))))

(use-package magit
  :defer
  :bind ("C-x g" . 'magit-status)
  )

(use-package magit-find-file
  :defer
  :bind ("C-c p" .  'magit-find-file-completing-read)
  )


;; https://github.com/bizzyman/LSP-Symbol-Outline
;;mw move into lsp-mode-hook
;; (require 'lsp-symbol-outline)
(defun lsp-symbol-outline-create-conditional ()
    (interactive)
    (cond ((equal major-mode 'python-mode)
           (lsp-symbol-outline-make-outline-python))
          ((equal major-mode 'go-mode)
           (lsp-symbol-outline-make-outline-go))
          ((equal major-mode 'php-mode)
           (lsp-symbol-outline-make-outline-php))
          ((equal major-mode 'rust-mode)
           (lsp-symbol-outline-make-outline-rust))
          ((or (equal major-mode 'c-mode)
                (equal major-mode 'c++-mode))
           (lsp-symbol-outline-make-outline-C))
          ((or (equal major-mode 'js2-mode)
               (equal major-mode 'js-mode)
               (equal major-mode 'typescript-mode))
           (lsp-symbol-outline-make-outline-js))
          ((equal major-mode 'java-mode)
           (lsp-symbol-outline-make-outline-java))))

;; mode-specific-map is typically the "C-c" prefix map
(define-key mode-specific-map "M-." 'lsp-symbol-outline-create-conditional)


;; END Java Dev't Env
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(appt-activate 1) ;; Enable appointment reminders
;; https://github.com/kiwanami/emacs-calfw
(use-package calfw)
(use-package calfw-cal) ;; for diary entries

(use-package calfw-gcal
  :config
  ;; (define-key cfw: calendar-mode-map (kbd "a" ) 'cfw: gcal-main)
  )

;; Unicode thin
;; (setq cfw:fchar-horizontal-line 9472
;;       cfw:fchar-junction 9532
;;       cfw:fchar-left-junction 9500
;;       cfw:fchar-right-junction 9508
;;       cfw:fchar-top-junction 9516
;;       cfw:fchar-top-left-corner 9581
;;       cfw:fchar-top-right-corner 9582
;;       cfw:fchar-vertical-line 9474)

;; Unicode characters thick
;; (setq cfw:fchar-junction ?╋
;;       cfw:fchar-vertical-line ?┃
;;       cfw:fchar-horizontal-line ?━
;;       cfw:fchar-left-junction ?┣
;;       cfw:fchar-right-junction ?┫
;;       cfw:fchar-top-junction ?┳	
;;       cfw:fchar-top-left-corner ?┏
;;       cfw:fchar-top-right-corner ?┓)

;; Another unicode chars double lines
;; (setq cfw:fchar-junction ?╬
;;       cfw:fchar-vertical-line ?║
;;       cfw:fchar-horizontal-line ?═
;;       cfw:fchar-left-junction ?╠
;;       cfw:fchar-right-junction ?╣
;;       cfw:fchar-top-junction ?╦
;;       cfw:fchar-top-left-corner ?╔
;;       cfw:fchar-top-right-corner ?╗)

(defun sqlparse-region (beg end)
  (interactive "r")
  (shell-command-on-region
   beg end
   "python -c 'import sys, sqlparse; print(sqlparse.format(sys.stdin.read(), reindent=True))'"
   t t))

;; http://ergoemacs.org/emacs/emacs_customize_default_window_size.html
;; (if (display-graphic-p)
    ;; (progn
    ;;   (setq initial-frame-alist
    ;;         '(
    ;;           (tool-bar-lines . 0)
    ;;           (width . 140) ; chars
    ;;           (height . 60) ; lines
    ;;           (left . 750)
    ;;           (top . 0)))
    ;;   (setq default-frame-alist
    ;;         '(
    ;;           (tool-bar-lines . 0)
    ;;           (width . 140)
    ;;           (height . 60)
    ;;           (left . 750)
    ;;           (top . 0)))))

;; https://writequit.org/articles/working-with-logs-in-emacs.html
(use-package log4j-mode
  :disabled t
  :init
  (add-hook #'log4j-mode-hook #'view-mode)
  (add-hook #'log4j-mode-hook #'read-only-mode)
  (add-hook #'log4j-mode-hook 'eos/turn-on-hl-line))

(add-to-list 'auto-mode-alist '("\\debug.txt\\'" . logview-mode))
(add-to-list 'auto-mode-alist '("\\Appmaster.std\\'" . logview-mode))


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
  (add-hook 'treemacs-mode-hook (lambda () (treemacs-resize-icons  16))))

(defun toggle-n-next ()
  (interactive)
    (treemacs--expand-dir-node (treemacs-current-button))
    (treemacs-next-line))
;; (treemacs-define-RET-action ’dir-node-closed (lambda () (progn treemacs-toggle-node treemacs-next-line)))

;;mw Treemacs stuff that broke init.el somewhere

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

(use-package treemacs-projectile
  :defer
  )

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

;; elisp stuff
(use-package elisp-refs
  :commands (elisp-refs-function elisp-refs-macro elisp-refs-variable
             elisp-refs-special elisp-refs-symbol)
  :bind (:map lisp-mode-shared-map
	      ("M-<f7>"   . elisp-refs-function))) ; like IntelliJ

(defun xah-show-formfeed-as-line ()
  "Display the formfeed ^L char as line.
URL `http://ergoemacs.org/emacs/emacs_form_feed_section_paging.html'
Version 2018-08-30"
  (interactive)
  ;; 2016-10-11 thanks to Steve Purcell's page-break-lines.el
  (progn
    (when (not buffer-display-table)
      (setq buffer-display-table (make-display-table)))
    (aset buffer-display-table ?\^L
          (vconcat (make-list 70 (make-glyph-code ?─ 'font-lock-comment-face))))
    (redraw-frame)))
;; Xah's keys for moving to prev/next code section (Form Feed; ^L). Consistent with lisp nav
(global-set-key (kbd "<C-M-prior>") 'backward-page) ; Ctrl+Alt+PageUp
(global-set-key (kbd "<C-M-next>") 'forward-page)   ; Ctrl+Alt+PageDown

(use-package projectile
  :config
  ;;mw Don't have a "Super" key defined on my mac (yet, 2019-10)
  ;; (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(setq sql-connection-alist '(
      ("qa-redshift"
	(sql-product 'postgres)
	(sql-user "segment")
	(sql-server "lpi.cegcmwpsftfz.us-east-1.redshift.amazonaws.com")
	(sql-database "app")
	(sql-port 5439))
      ("test-redshift"
       (sql-product 'postgres)
       (sql-user "segment")
       (sql-server "mwarren-test.cegcmwpsftfz.us-east-1.redshift.amazonaws.com")
       (sql-database "app")
       (sql-port 5439))
      ("prod-redshift"
       (sql-product 'postgres)
       (sql-user "segment")
       (sql-server "mwarren-test.cegcmwpsftfz.us-east-1.redshift.amazonaws.com")
       (sql-database "app")
       (sql-port 5439))
      ))

;; https://www.emacswiki.org/emacs/Desktop
(setq desktop-buffers-not-to-save
        (concat "\\("
                "^nn\\.a[0-9]+\\|\\.log\\|(ftp)\\|^tags\\|^TAGS"
                "\\|\\.emacs.*\\|\\.diary\\|\\.newsrc-dribble\\|\\.bbdb"
	        "\\)$"))


;;mw Use customize instead
;; (add-to-list 'desktop-modes-not-to-save 'fundamental-mode)
;; (let (modes-not-to-save '(dired-mode tags-table-mode Info-mode
;;			  treemacs-mode info-lookup-mode fundamental-mode))

(which-key-setup-side-window-right-bottom)
;; (which-key-setup-minibuffer)

(server-start)

;; Automatically inserted by emacs

(put 'narrow-to-page 'disabled nil)
(put 'scroll-left 'disabled nil)

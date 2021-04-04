(menu-bar-mode -1)	; Disable the tool bar
(tool-bar-mode -1)	; Disable the tool bar
(tooltip-mode -1) 	; Disable tooltips
(scroll-bar-mode -1) 	; Disable visible scrollbar
(set-fringe-mode 10) 	; Give Some breathing room

(setq inhibit-startup-message t)

;; Set default working directory if runing on windows
(pcase system-type
  ('windows-nt (setq default-directory "~/")))

(setq ai/default-font-size 110)
(setq ai/default-variable-font-size 110)
(defun ai/set-font-faces ()
  "setting the font faces attributes"
  (message "Setting faces!")
  ;; Set the font
  (set-face-attribute 'default nil :font "Fira Code Retina" :height ai/default-font-size)
  ;; Set the fixed pitch face
  (set-face-attribute 'fixed-pitch nil :font "Fira Code Retina" :height ai/default-font-size)
  ;; Set the variable pitch face
  (set-face-attribute 'variable-pitch nil :font "Cantarell" :height ai/default-variable-font-size :weight 'regular))

(if (daemonp)
    (add-hook 'after-make-frame-functions
	      (lambda (frame)
		(setq doom-modeline-icon t)
		(with-selected-frame frame
		  (ai/set-font-faces))))
  (ai/set-font-faces))

;; Set up the visible bell
(setq visible-bell t)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable display line numbers mode for some buffers
(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hook
		treemacs-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(require 'package)
(setq package-native-compile t)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

(use-package general
  :config
  (general-create-definer ai/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (ai/leader-keys
    "g" '(magit-file-dispatch :which-key "magit-file-dispatch")
    "j" '(counsel-switch-buffer :which-key "buffers")
    "ts" '(hydra-text-scale/body :which-key "scale text")))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ("C-c d" . #'helpful-at-point)
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package evil
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-replace-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions evenjoutside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-numbers
  :bind
  ("C-a" . evil-numbers/inc-at-pt)
  ("C-S-a" . evil-numbers/dec-at-pt))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package goto-chg)

(use-package undo-fu
  :config
  ;; (global-undo-tree-mode -1)
  (define-key evil-normal-state-map "u" 'undo-fu-only-undo)
  (define-key evil-normal-state-map "\C-r" 'undo-fu-only-redo))

(use-package undo-fu-session
  :config
  (setq undo-fu-session-incompatible-files '("/COMMIT_EDITMSG\\'" "/git-rebase-todo\\'"))
  (global-undo-fu-session-mode))

(use-package flycheck
  :hook (lsp-mode . flycheck-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook
  (c++-mode . lsp)
  (c-mode . lsp)
  (java-mode . lsp)
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-enable-snippet t)
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024))
  (setq lsp-idle-delay 0.200)
  :config
  (lsp-enable-which-key-integration t)
)

(use-package lsp-java
  :hook (java-mode-hook . lsp))

(use-package lsp-ui)

;; Define functions for a functional yasnippet/company mode workflow
(defun ai/yas-next-field-or-maybe-expand ()
  "Call `open-line', unless there are abbrevs or snippets at point.
In that case expand them.  If there's a snippet expansion in
progress, move to the next field. Call `open-line' if nothing
else applies."
  (interactive)
  (cond ((expand-abbrev))

        ((yas-active-snippets)
         (yas-next-field-or-maybe-expand))

        ((ignore-errors
           (yas-expand)))
        ))

(defun ai/yas-prev-field-or-ret ()
  "Call `evil-ret', unless there is snippet at point.
If there's a snippet expansion in progress, move to the previous
field. Call `evil-ret' if nothing else applies."
  (interactive)
  (cond ((yas-active-snippets)
         (yas-prev-field))

	((ignore-errors
	   (evil-ret)))
        ))

(global-set-key "\C-l" 'ai/yas-next-field-or-maybe-expand)
(global-set-key "\C-m" 'ai/yas-prev-field-or-ret)

(use-package yasnippet
  :config
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  ;; (define-key yas-minor-mode-map (kbd "C-l") ai/yas-next-field-or-maybe-expand)

  ;; keys for navigation
  (define-key yas-keymap [(tab)]       nil)
  (define-key yas-keymap (kbd "TAB")   nil)
  (define-key yas-keymap [(shift tab)] nil)
  (define-key yas-keymap [backtab]     nil)
  ;; (define-key yas-keymap (kbd "C-m") 'ai/yas-prev-field-or-ret)

  (yas-global-mode t))

(use-package yasnippet-snippets)

(use-package company
  :hook (prog-mode . company-mode)
  :bind
  (:map company-active-map
	("<tab>" . company-complete-selection))
  (:map company-active-map
	("TAB" . company-complete-selection))
  (:map company-active-map
	("C-h" . evil-delete-backward-char-and-join))
  (:map company-active-map
	("C-g" . company-abort))
  (:map company-active-map
	("C-j" . company-select-next))
  (:map company-active-map
	("C-k" . company-select-previous))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0)
  (add-to-list 'company-backends 'company-c-headers)
  (add-to-list 'company-backends 'company-yasnippet))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
	doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-dracula t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package all-the-icons)

(use-package all-the-icons-ivy
  :init (add-hook 'after-init-hook 'all-the-icons-ivy-setup))

(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package smartparens
  :config
  (require 'smartparens-config)
  :hook
  (prog-mode . smartparens-mode))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :init
  (ivy-mode 1)
  :config
  (ivy-mode 1))

(use-package prescient
  :config
  (setq prescient-sort-length-enable nil)
  (prescient-persist-mode 1))

(use-package ivy-prescient
  :after counsel
  :config
  (ivy-prescient-mode 1))

(use-package company-prescient
  :after company
  :config
  (company-prescient-mode 1))

(use-package ivy-rich
  :init (ivy-rich-mode 1))
(setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history)))

(defun ai/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
			  '(("^ *\\([-]\\) "
			     (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "►"))))))


  (dolist (face '((org-level-1 . 1.2)
		  (org-level-2 . 1.1)
		  (org-level-3 . 1.05)
		  (org-level-4 . 1.0)
		  (org-level-5 . 0.9)
		  (org-level-6 . 0.9)
		  (org-level-7 . 0.9)
		  (org-level-8 . 0.9)))
    (set-face-attribute (car face) nil :font "Cantarell" :weight 'bold :height (cdr face))))

(defun ai/org-mode-setup ()
  (org-indent-mode)
  ;; (variable-pitch-mode 1)
  (visual-line-mode 1))

(use-package org
  :pin org
  :hook (org-mode . ai/org-mode-setup)
  :config
  (setq org-ellipsis " ↯")
  ;; (setq org-hide-emphasis-markers t)
  (ai/org-font-setup))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun ai/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
	visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . ai/org-mode-visual-fill))

(use-package magit)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(evil-numbers evil-collection magit smartparens visual-fill-column org-bullets undo-fu-session undo-fu lsp-mode evil use-package)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

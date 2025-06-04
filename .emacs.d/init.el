;;
;; UI
;;

;; Disable beeping
(setq ring-bell-function 'ignore)

;; Colors
(load-theme 'tango-dark)
;;(add-to-list 'default-frame-alist '(foreground-color . "#ffffff"))
;;(add-to-list 'default-frame-alist '(background-color . "#000000"))
;;(set-foreground-color "#ffffff")
;;(set-background-color "#000000")
(set-face-attribute 'default nil :background "#000000" :foreground "#ffffff")
(set-face-attribute 'fringe nil :background "#000000" :foreground "#ffffff")
(set-face-attribute 'mode-line nil :background "#000000" :foreground "#ffffff")

;;Font
(set-face-attribute 'default nil :height 190)

;; Transparency
(set-frame-parameter nil 'alpha-background 85)
(add-to-list 'default-frame-alist '(alpha-background . 85))

;; Disable useless ui
(menu-bar-mode -1) 
(scroll-bar-mode -1) 
(tool-bar-mode -1)
(blink-cursor-mode 0)
(setq show-paren-delay 0)
(show-paren-mode 1)

;;
;; Packages and Modes
;;

;; Add locally installed packages
(add-to-list 'load-path "~/.emacs.d/local-plug/")

(require 'expand-region)
(global-set-key (kbd "C-;") 'er/expand-region)
(global-set-key (kbd "C-M-;") 'er/contract-region)

;; Simple C mode so that Emacs won't lag
(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\'" . simpc-mode))
(add-to-list 'auto-mode-alist '("\\.[hc]pp\\'" . simpcpp-mode))

;; Multiple Cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Snippets
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))

;; Clang format
(require 'clang-format)
(global-set-key (kbd "C-c i") 'clang-format-region)
(global-set-key (kbd "C-c u") 'clang-format-buffer)
(setq clang-format-style-option "Microsoft")

;; Auto pairs
(electric-pair-mode 1)

;;
;; Autosaves and Backups
;;

;;Backup directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
;;Delete old backups
(setq delete-old-versions t)
;;Backup even in git directory
(setq vc-make-backup-files t)
;;Preserve metadata
(setq backup-by-copying t)
;;Autosave directory
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/autosaves/" t)))

;;
;; Functionality
;;

;; Open terminal from emacs
(defun open-term ()
    (interactive)
     (start-process "terminal" nil "urxvt")) 
(global-set-key (kbd "C-<f7>") 'open-term)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(expand-region multiple-cursors yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init-bootstrap.el -- My bootstrap configuration.
;;; Commentary:
;;; Code:
;; Essential settings.

(setq user-full-name "robert zhou")
(setq user-mail-address "robertzhouxh@gmail.com")

;; Use utf8
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-next-selection-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; from Sacha page
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

;; tabs do not turn spaces into tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; start
(setq inhibit-splash-screen t
      initial-scratch-message nil
      inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      select-enable-clipboard t
      coding-system-for-read 'utf-8
      coding-system-for-write 'utf-8
      )

(menu-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode 1)
(electric-indent-mode 1)
(global-auto-revert-mode t)
(unless (display-graphic-p)
  (setq-default linum-format "%d "))
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(setq backup-directory-alist (list (cons "." backup-dir)))
(setq make-backup-files nil)
(setq default-directory "~/githubs")
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(setq vc-follow-symlinks t)
(setq large-file-warning-threshold nil)
;(setq split-width-threshold nil)
;(setq split-width-threshold 160)
(setq split-width-threshold 0)
(setq split-height-threshold nil)

(setq-default left-fringe-width nil)
(eval-after-load "vc" '(setq vc-handled-backends nil))
(defalias 'yes-or-no-p 'y-or-n-p)

; Set default font
(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 140
                    :weight 'normal
                    :width 'normal)

;; This makes my Emacs startup time ~35% faster.
(setq gc-cons-threshold 100000000)

(define-minor-mode disable-mouse-mode
                   "A minor-mode that disables all mouse keybinds."
                   :global t
                   :lighter " 🐭"
                   :keymap (make-sparse-keymap))

(dolist (type '(mouse down-mouse drag-mouse
                      double-mouse triple-mouse))
  (dolist (prefix '("" C- M- S- M-S- C-M- C-S- C-M-S-))
    ;; Yes, I actually HAD to go up to 7 here.
    (dotimes (n 7)
      (let ((k (format "%s%s-%s" prefix type n)))
        (define-key disable-mouse-mode-map
                    (vector (intern k)) #'ignore)))))

;;; essential libs
;(use-package s :ensure t  :config (progn (require 's t)))
(use-package s        :ensure t :defer t)
(use-package cl       :ensure t :defer t)
(use-package ht       :ensure t :defer t)
(use-package git      :ensure t :defer t)
(use-package dash     :ensure t :defer t)
(use-package mustache :ensure t :defer t)
(use-package popup    :ensure t :defer t)

;(require 's)
;(require 'cl)
;(require 'ht)
;(require 'git)
;(require 'dash)
;(require 'mustache)

(provide 'init-bootstrap)

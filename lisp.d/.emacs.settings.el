;;; -*- lexical-binding: t; -*-

;; first things
(setq user-full-name "Adam Schaefers"
      user-mail-address "paxchristi888@gmail.com"
      initial-major-mode 'emacs-lisp-mode
      inhibit-startup-screen nil
      custom-file "/dev/null")

;; begin with `better-defaults'
(progn
  (unless (or (fboundp 'helm-mode) (fboundp 'ivy-mode))
    (ido-mode t)
    (setq ido-enable-flex-matching t))

  (unless (eq window-system 'ns)
    (menu-bar-mode -1))
  (when (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
  (when (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))
  (when (fboundp 'horizontal-scroll-bar-mode)
    (horizontal-scroll-bar-mode -1))

  (autoload 'zap-up-to-char "misc"
    "Kill up to, but not including ARGth occurrence of CHAR." t)

  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward)

  (require 'saveplace)
  (setq-default save-place t)

  (global-set-key (kbd "M-/") 'hippie-expand)
  (global-set-key (kbd "C-x C-b") 'ibuffer)
  (global-set-key (kbd "M-z") 'zap-up-to-char)

  (global-set-key (kbd "C-s") 'isearch-forward-regexp)
  (global-set-key (kbd "C-r") 'isearch-backward-regexp)
  (global-set-key (kbd "C-M-s") 'isearch-forward)
  (global-set-key (kbd "C-M-r") 'isearch-backward)

  (show-paren-mode 1)
  (setq-default indent-tabs-mode nil)
  (setq save-interprogram-paste-before-kill t
        apropos-do-all t
        mouse-yank-at-point t
        require-final-newline t
        visible-bell t
        load-prefer-newer t
        ediff-window-setup-function 'ediff-setup-windows-plain
        save-place-file (concat user-emacs-directory "places")
        backup-directory-alist `(("." . ,(concat user-emacs-directory
                                                 "backups")))))

;; my preferences on top of `better-defaults'
;; + settings I found from Prelude and Spacemacs
(ido-mode t)
(setq ido-everywhere t
      ido-enable-flex-matching t
      ido-use-filename-at-point 'guess
      ido-create-new-buffer 'always
      ido-auto-merge-work-directories-length -1
      visible-bell nil
      tab-always-indent 'complete
      tramp-default-method "ssh"
      vc-follow-symlinks t
      tramp-copy-size-limit nil
      browse-url-browser-function 'eww-browse-url
      save-interprogram-paste-before-kill t
      dired-auto-revert-buffer t)

(setq-default indent-tabs-mode nil
              tab-width 8
              fill-column 80)

(delete-selection-mode 1)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(fset 'yes-or-no-p 'y-or-n-p)

(winner-mode 1)

(defun spacemacs/alternate-buffer (&optional window)
  (interactive)
  (let ((current-buffer (window-buffer window)))
    (switch-to-buffer
     (cl-find-if (lambda (buffer)
                   (not (eq buffer current-buffer)))
                 (mapcar #'car (window-prev-buffers window))))))
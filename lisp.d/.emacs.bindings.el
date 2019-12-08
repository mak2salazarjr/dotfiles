;;; -*- lexical-binding: t; -*-

;; Swapping lctl and lalt is the easiest way to make Emacs ergo-friendly.
;; And Place a helpful hydra menu on Caps Lock.
(start-process-shell-command "setxkbmap" nil "setxkbmap -option ctrl:swap_lalt_lctl -option caps:menu")

;; Faster keyboard repeat
(start-process-shell-command "xset" nil "xset r rate 200 60")

(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))
(global-set-key (kbd "<C-tab>") 'spacemacs/alternate-buffer)
(global-set-key (kbd "<home>") 'keychain-unlock)
(global-set-key (kbd "<end>") 'keychain-lock)
(global-set-key (kbd "C-c i") 'my-erc)
(global-set-key (kbd "C-c b") 'eww)
(global-set-key (kbd "C-c m") 'gnus)
(global-set-key (kbd "C-c $") 'shell)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "<C-kp-add>") (lambda()(interactive)(my-font-resizer 1)))
(global-set-key (kbd "<C-kp-subtract>") (lambda()(interactive)(my-font-resizer -1)))
(global-set-key (kbd "<f5>") 'compile)
(global-set-key (kbd "C-c C-;") 'comment-line)
(global-set-key (kbd "C-c t r") 'region-to-termbin)
(global-set-key (kbd "C-c t b") 'buffer-to-termbin)
(global-set-key (kbd "<s-return>")
                '(lambda (command)
                   (interactive (list (read-shell-command "$ ")))
                   (start-process-shell-command command nil command)))

(use-package browse-kill-ring :bind (("M-y" . browse-kill-ring)))

(use-package crux
  :defer t
  :bind (("C-c r" . crux-rename-buffer-and-file)
         ("C-c k" . crux-kill-whole-line)
         ("<C-backspace>" . crux-kill-line-backwards)
         ("C-c #" . crux-create-scratch-buffer)
         ("C-o" . crux-smart-open-line-above)
         ("C-j" . crux-smart-open-line)
         ("C-c r" . crux-recentf-find-file)
         ("C-c r" . crux-rename-buffer-and-file)
         ("C-c d" . crux-duplicate-current-line-or-region)
         ("C-c D" . crux-delete-buffer-and-file)
         ("C-c K" . crux-kill-other-buffers)
         ("C-c I" . crux-find-user-init-file)))

(use-package hydra
  :init (use-package transpose-frame :defer t)
  :bind (("<menu>" . windows-hydra/body))
  :config
  (defhydra windows-hydra (:exit nil)
    ("h" (call-interactively 'shrink-window-horizontally) "shrink-left")
    ("j" (call-interactively 'shrink-window) "shrink-down")
    ("k" (call-interactively 'enlarge-window) "grow-up")
    ("l" (call-interactively 'enlarge-window-horizontally) "grow-right")
    ("r" (rotate-frame-anticlockwise) "rotate")
    ("o" (call-interactively 'other-window))
    ("1" (call-interactively 'delete-other-windows))
    ("2" (call-interactively 'split-window-below))
    ("3" (call-interactively 'split-window-right))
    ("0" (call-interactively 'delete-window))
    ("<menu>" nil)))

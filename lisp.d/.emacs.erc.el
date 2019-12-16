;;; -*- lexical-binding: t; -*-

(defun my-erc ()
  (interactive)
  (erc-tls :server "chat.freenode.net" :port "6697"))

(with-eval-after-load 'erc
  (setq erc-hide-list '("JOIN" "PART" "QUIT")
      erc-autojoin-timing "ident"
      erc-prompt-for-password nil
      erc-nick "adamantium"
      erc-autojoin-channels-alist '(("freenode.net"
                                     "#kisslinux"
                                     "#emacs"
                                     "#commanduser"
                                     "#phrackaged2")))

  (defun my-erc-multi-line-disable (string)
    "disable sending of multi-line messages entirely to avoid accidental flooding"
    (if (string-match-p "\n+" string)
        (setq str nil)))
  (add-hook 'erc-send-pre-hook 'my-erc-multi-line-disable))

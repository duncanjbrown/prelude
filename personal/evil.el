(prelude-require-packages '(general evil-collection))

(general-evil-setup t)

(evil-collection-init)

(general-def :states '(normal motion emacs) "SPC" nil)

(nvmap :prefix "SPC"
  "SPC" 'helm-M-x
  "bb" 'helm-buffers-list
  "br" 'helm-recentf
  "bd" 'kill-this-buffer
  "bn" 'next-buffer
  "bp" 'previous-buffer
  "fs" 'save-buffer
  "kk" 'kill-other-buffers
  "pf" 'helm-projectile-find-file
  "ff" 'helm-projectile-ag
  "TAB" 'spacemacs/alternate-buffer)

(global-set-key (kbd "M-3")(lambda () (interactive) (insert "#")))

;; Begin git commit messages in INSERT
(add-hook 'git-commit-mode-hook 'evil-insert-state)
(add-hook 'cider-repl-mode-hook 'evil-insert-state)

(prelude-require-package 'org-bullets)

(require 'org)

;; all org files are agenda files
(add-to-list 'org-agenda-files (expand-file-name "~/Dropbox/org"))

;; refile to the same files
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

;; express bold, italic etc as they are, not via _, * etc
(setq org-hide-emphasis-markers t)

;; Use variable pitch mode, bullets and visual-line-mode
(add-hook 'org-mode-hook (lambda ()
                           (org-bullets-mode t)
                           (variable-pitch-mode 1)
                           (visual-line-mode)))

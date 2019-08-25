(prelude-require-package 'org-bullets)

(require 'org)

(setq org-agenda-files (apply 'append
                              (mapcar
                               (lambda (directory)
                                 (directory-files-recursively
                                  directory org-agenda-file-regexp))
                               '("~/Dropbox/org"))))

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
;; Refile config
;; https://blog.aaronbieber.com/2017/03/19/organizing-notes-with-refile.html
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes 'confirm)

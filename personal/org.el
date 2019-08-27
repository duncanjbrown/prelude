(prelude-require-packages '(org-bullets mermaid-mode ob-mermaid))

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

;; capture
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "~/Dropbox/org/refile-beorg.org")

;; mermaid in literate programming
(setq ob-mermaid-cli-path "/usr/local/bin/mmdc")

(prelude-require-packages '(org-bullets mermaid-mode ob-mermaid ox-tufte htmlize))

(require 'org)

(setq org-files (apply 'append
                       (mapcar
                        (lambda (directory)
                          (directory-files-recursively
                           directory org-agenda-file-regexp))
                        '("~/Dropbox/org"))))

(setq org-agenda-files '("~/Dropbox/org/work.org" "~/Dropbox/org/tasks.org"))

;; refile to the same files
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-files :maxlevel . 9))))

;; express bold, italic etc as they are, not via _, * etc
(setq org-hide-emphasis-markers t)

;; Use variable pitch mode and bullets
(add-hook 'org-mode-hook (lambda ()
                           (org-bullets-mode t)
                           (auto-fill-mode t)
                           (org-indent-mode t)
                           (company-mode -1)
                           (variable-pitch-mode 1)))

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "|" "DONE")
        (sequence "READ" "REVIEW" "|" "FINISHED")
        (sequence "SHARE" "|" "SHARED")
        (sequence "WRITE" "IN PROGRESS" "|" "PUBLISHED")
        (sequence "SPIKE" "FEATURE" "|" "REJECTED" "ADOPTED")))

(setq org-log-done 'time)

;; Refile config
;; https://blog.aaronbieber.com/2017/03/19/organizing-notes-with-refile.html
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes 'confirm)
(advice-add 'org-refile :after
            (lambda (&rest _)
              (org-save-all-org-buffers)))

;; capture
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "~/Dropbox/org/refile-beorg.org")

;; literate programming
(setq org-confirm-babel-evaluate nil)

;; mermaid in literate programming
(setq ob-mermaid-cli-path "/usr/local/bin/mmdc")

;; export
(setq org-html-validation-link nil)
(require 'ob-mermaid)
(require 'ox-tufte)
(require 'ox-md)
;; capture templates
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Dropbox/org/tasks.org" "Tasks")
         "* TODO %?\n  %i\n")
        ("w" "Work todo" entry (file+headline "~/Dropbox/org/work.org" "Work")
         "* TODO %?\n  %i\n")
        ("m" "Meeting" entry (file+headline "~/Dropbox/org/tasks.org" "Meetings")
         "* %? \n%U\n  %i\n")
        ("n" "Note" entry (file+headline "~/Dropbox/org/notes.org" "Notes")
         "* %? \n  %i\n %a")
        ("j" "Journal" entry (file+datetree "~/Dropbox/org/journal.org")
         "* %? \n%U\n  %i\n  %a")))

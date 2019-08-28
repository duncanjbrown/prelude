(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(setq prelude-theme 'solarized-dark)
(set-default-font "IBM Plex Mono-13")
(setq default-frame-alist '((font . "IBM Plex Mono-13") (fullscreen . maximized)))

;; line numbers
(global-display-line-numbers-mode)
(setq display-line-numbers 'relative)

;; disable smartparens
(advice-add #'smartparens-mode :before-until (lambda (&rest args) t))

;; set fixed- and variable-pitched (for org mode) fonts
(custom-theme-set-faces
 'user
 '(variable-pitch       ((t (:family "IBM Plex Serif" :height 160 :weight normal))))
 '(fixed-pitch          ((t ( :family "IBM Plex Mono" :slant normal :weight normal :height 0.8 :width normal))))
 '(org-block            ((t (:inherit fixed-pitch))))
 '(org-code             ((t (:inherit fixed-pitch))))
 '(org-block-begin-line ((t (:inherit fixed-pitch :slant italic))))
 '(org-block-end-line   ((t (:inherit org-block-begin-line))))
 '(org-meta-line        ((t (:inherit org-block-begin-line)))))

;; scrolloff
(setq scroll-margin 10)

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(setq prelude-theme 'solarized-dark)
(set-default-font "IBM Plex Mono-13")
(setq default-frame-alist '((font . "IBM Plex Mono-13")))

;; line numbers
(global-display-line-numbers-mode)
(setq display-line-numbers 'relative)

;; allow page up in evil
(setq evil-want-C-u-scroll t)
(advice-add #'smartparens-mode :before-until (lambda (&rest args) t))

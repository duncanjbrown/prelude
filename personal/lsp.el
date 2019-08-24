(prelude-require-packages '(lsp-mode company-lsp lsp-ui))

(add-hook 'ruby-mode-hook #'lsp)
(setq lsp-enable-snippet nil)

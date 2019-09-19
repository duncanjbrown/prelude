(prelude-require-packages '(flycheck-pos-tip flycheck))

(setq flycheck-global-modes '(not org-mode))
(setq global-flycheck-mode 1)

(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

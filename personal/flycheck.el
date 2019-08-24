(prelude-require-package 'flycheck-pos-tip)
(setq global-flycheck-mode 1)

(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

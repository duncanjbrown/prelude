(prelude-require-package 'flycheck-clojure)

(with-eval-after-load 'cider
  (flycheck-clojure-setup))

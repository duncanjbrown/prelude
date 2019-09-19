(prelude-require-package 'flymake-json)
(add-hook 'json-mode-hook 'flymake-json-load)

;; https://stackoverflow.com/questions/17901900/how-can-i-set-a-tab-width-for-json-files
;; "make-local-variable" reduces the scope so this doesn't interfere with js-mode
(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))

;; javascript / html
(require 'js2-mode)
(require 'js2-refactor)

(require 'company)
(require 'tern)
(require 'company-tern)
;; (require 'prettier-js)


(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(setq js-indent-level 2)
(setq js2-cleanup-whitespace t)
;; turn off all warnings in js2-mode
(setq js2-mode-show-parse-errors t)
(setq js2-mode-show-strict-warnings nil)

(add-hook 'js2-mode-hook 'js2-imenu-extras-mode)
(add-hook 'js2-mode-hook 'js2-refactor-mode)
(add-hook 'js2-mode-hook 'tern-mode)
(add-hook 'js2-mode-hook 'company-mode)

;; (add-hook 'js2-mode-hook 'prettier-js-mode)
;; (add-hook 'web-mode-hook 'prettier-js-mode)

(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

;; standard js!
;; (setq prettier-js-args '(
;;   "--trailing-comma" "none"
;;   "--jsxBracketSameLine" "true"
;;   "--bracket-spacing" "true"
;;   "--printWidth" "80"
;;   "--semi" "false"
;;   "--singleQuote" "true"
;;   "--tabWidth" "2"
;;   "--useTabs" "false"
;; ))

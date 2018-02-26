;; Customizations relating to editing a buffer.

;; Key binding to use "hippie expand" for text autocompletion
;; http://www.emacswiki.org/emacs/HippieExpand
(global-set-key (kbd "M-/") 'hippie-expand)

;; Lisp-friendly hippie expand
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;; Highlights matching parenthesis
(show-paren-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

;; Interactive search key bindings. By default, C-s runs
;; isearch-forward, so this swaps the bindings.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Don't use hard tabs
(setq-default indent-tabs-mode nil)

;; When you visit a file, point goes to the last place where it
;; was when you previously visited the same file.
;; http://www.emacswiki.org/emacs/SavePlace
(require 'saveplace)
(setq-default save-place t)
;; keep track of saved places in ~/.emacs.d/places
(setq save-place-file (concat user-emacs-directory "places"))

;; Emacs can automatically create backup files. This tells Emacs to
;; put all backups in ~/.emacs.d/backups. More info:
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(setq auto-save-default nil)


;; comments
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)

;; yay rainbows!
(global-rainbow-delimiters-mode t)

;; use 2 spaces for tabs
(defun die-tabs ()
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))

;; fix weird os x kill error
(defun ns-get-pasteboard ()
  "Returns the value of the pasteboard, or nil for unsupported formats."
  (condition-case nil
      (ns-get-selection-internal 'CLIPBOARD)
    (quit nil)))

(setq electric-indent-mode nil)

;; shift-select and delete-selection are standard is OS X inputs
(setq shift-select-mode t) 
(delete-selection-mode t)

;; command + up/down/left/right = file start/end, line start/end
(global-set-key (kbd "<s-up>")    'beginning-of-buffer)
(global-set-key (kbd "<s-down>")  'end-of-buffer)
(global-set-key (kbd "<s-left>")  'move-beginning-of-line)
(global-set-key (kbd "<s-right>") 'move-end-of-line)

(define-key global-map (kbd "s-+") 'text-scale-increase)
(define-key global-map (kbd "s--") 'text-scale-decrease)

;; ESC is normally used to begin certain control sequences in emacs,
;; but universally used for 'quit' by everything else. This normalizes
;; with everything else.
(defun jackrusher-escape-quit ()
  "Quit the current action, a la C-g, and unhighlight any
lingering search matches. This is for users who come from an
<escape> cancels everything culture."
  (interactive)
  (keyboard-escape-quit)
  (lazy-highlight-cleanup))
(global-set-key (kbd "<escape>") 'jackrusher-escape-quit) 

;; don't use the right alt/option key as M-, so it can still be used
;; to type accented characters. Fück yeah.
(setq ns-alternate-modifier 'meta)
(setq ns-right-alternate-modifier 'none)

;; expand-region is super handy! I like having expand- and contract-
;; side by side within easy reach.
(require 'expand-region)
(global-set-key (kbd "s-1") 'er/expand-region)
(global-set-key (kbd "s-2") 'er/contract-region)

;; I can't get today's kids interested in set-mark, so I've repurposed
;; C-SPC for ace-jump-mode.
(require 'ace-jump-mode)
(global-set-key (kbd "C-SPC") 'ace-jump-mode)

;; Multiple cursors magic
(global-set-key (kbd "C-,") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)

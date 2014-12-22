;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(css-indent-offset 4)
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
	("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(desktop-save-mode 1)
 '(flycheck-disabled-checkers (quote (javascript-eslint javascript-gjslint)))
 '(flycheck-jshintrc "/Users/drew/work/rmn/.jshintrc")
 '(js2-global-externs
   (quote
	("define" "module" "require" "jQuery" "$" "_" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON" "dc" "JST" "Backbone")))
 '(js2-include-jslint-globals nil)
 '(js2-mode-show-strict-warnings nil)
 '(js2-strict-inconsistent-return-warning nil)
 '(js2-strict-trailing-comma-warning nil)
 '(js2-strict-var-hides-function-arg-warning nil)
 '(magit-use-overlays nil)
 '(scss-compile-at-save nil)
 '(setq indent-tabs-mode t)
 '(web-mode-code-indent-offset 4)
 '(web-mode-css-indent-offset 4)
 '(web-mode-markup-indent-offset 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(set-face-attribute 'default nil :font "Ubuntu Mono" :height 180)
(setq-default
 tab-width 4)

(setq-default indent-tabs-mode t)
(add-hook 'c-mode-common-hook
          (lambda () (setq indent-tabs-mode t)))

(add-to-list 'exec-path "/Users/drew/go/bin")
(setq exec-path (cons (expand-file-name "/usr/local/bin") exec-path))


(add-to-list 'exec-path "/usr/local/bin")

;; Ignore client attached warnings
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

;;Dash-at-point
(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)

;; Same window
(setq ns-pop-up-frames nil)

;; Disable gui prompts http://superuser.com/questions/125569/how-to-fix-emacs-popup-dialogs-on-mac-os-x
(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent yes-or-no-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))
(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent y-or-n-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))


;; js2-mode

(require 'js2-mode)

(setq-default js2-global-externs '("module" "require" "jQuery" "$" "_" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON" "dc" "JST" "Backbone"))

;; (eval-after-load 'js2-mode
;;   '(progn
;;      (require 'js2-imenu-extras)
;;      (js2-imenu-extras-setup)))

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(defun js2-mode-keybindings ()
  (local-set-key (kbd "M-n") 'next-error)
  (local-set-key (kbd "M-p") 'previous-error))

(add-hook 'js2-mode-hook
          (lambda ()
            (js2-mode-keybindings)
            ;; Scan the file for nested code blocks
            ;;(imenu-add-menubar-index)
            ;; Activate the folding mode
            (hs-minor-mode t)))

;;Beautify after js2-mode
;;https://github.com/yasuyk/web-beautify
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))

;;Hook to automatically format js files
;; (eval-after-load 'js2-mode
;;   '(add-hook 'js2-mode-hook
;;              (lambda ()
;;                (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

;; (require 'flymake-jshint)
(add-hook 'javascript-mode-hook
          (lambda () (flymake-mode t)))

(setq php-mode-coding-style (quote psr2))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (tango-dark)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-linum-mode 1)
(show-paren-mode)
(global-hl-line-mode 1)
(set-face-background 'hl-line "#3e4446")
(set-face-foreground 'highlight nil)
(global-auto-revert-mode 1)

;; (defun my-csharp-mode-hook ()
;;   ;; enable the stuff you want for C# here
;;   (electric-pair-mode 1)       ;; Emacs 24
;;   (electric-pair-local-mode 1) ;; Emacs 25
;;   )
;; (add-hook 'csharp-mode-hook 'my-csharp-mode-hook)

;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                      ("marmalade" . "http://marmalade-repo.org/packages/")
;;                      ("melpa" . "http://melpa.org/packages/")))


;; (when (>= emacs-major-version 24)
;;   (require 'package)
;;   (package-initialize)
;;   (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;   )


(setq ring-bell-function 'ignore)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

(setq-default auto-fill-function 'do-auto-fill)

;; (when window-system (set-frame-size (selected-frame) 197 54))
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(windmove-default-keybindings)

(setq-default mode-line-buffer-identification
              (let ((orig  (car mode-line-buffer-identification)))
                `(:eval (cons (concat ,orig (abbreviate-file-name default-directory))
                              (cdr mode-line-buffer-identification)))))

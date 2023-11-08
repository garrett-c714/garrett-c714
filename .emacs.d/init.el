(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(load-theme 'atom-one-dark t)

(if (display-graphic-p)
    (enable-theme 'atom-one-dark)
  (disable-theme 'atom-one-dark))

(tool-bar-mode -1)

(set-frame-font "Cascadia Code" nil t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)


(global-display-line-numbers-mode 1)

(set-window-scroll-bars (minibuffer-window) 0 'none)

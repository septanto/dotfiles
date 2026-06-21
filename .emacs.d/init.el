(defun my/detect-dark-mode ()
  "Detect if system is in dark mode."
  (or (eq (alist-get 'background-mode (frame-parameter nil 'window-parameters)) 'dark)
      (let ((gsettings (ignore-errors (shell-command-to-string "gsettings get org.gnome.desktop.interface color-scheme"))))
        (and gsettings (string-match-p "dark" gsettings)))
      (let ((gtk-file (or (ignore-errors
                            (with-temp-buffer
                              (insert-file-contents "~/.config/gtk-4.0/settings.ini")
                              (buffer-string)))
                          (ignore-errors
                            (with-temp-buffer
                              (insert-file-contents "~/.config/gtk-3.0/settings.ini")
                              (buffer-string))))))
        (and gtk-file (string-match-p "gtk-application-prefer-dark-theme=1\\|gtk-application-prefer-dark-theme=true" gtk-file)))))

(defun my/apply-theme-by-appearance ()
  "Load theme based on system appearance (dark/light)."
  (let ((bg-mode (if (my/detect-dark-mode) 'dark 'light)))
    (mapc #'disable-theme custom-enabled-themes)
    (load-theme (if (eq bg-mode 'dark) 'deeper-blue 'adwaita))))

(defun my/set-font ()
  "Set default font."
  (set-face-attribute 'default nil :font "Iosevka Nerd Font" :height 120))

(defun my/line-number-setup ()
  "Configure relative line numbers."
  (require 'display-line-numbers)
  (setq display-line-numbers-type 'relative)
  (global-display-line-numbers-mode 1))

;; Package management
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package if not installed
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package magit
  :ensure t)

(defun my/apply-settings ()
  (my/apply-theme-by-appearance)
  (my/set-font)
  (my/line-number-setup))
  (tool-bar-mode -1)

(my/apply-settings)
(add-hook 'window-setup-hook #'my/apply-settings)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-vivendi-tinted)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

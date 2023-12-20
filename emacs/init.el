;; this is the file that emacs runs whenever it starts.
;; Either we can have all the settings here, or we can use 
;; org mode to write our configuration in a seperate file,
;; and load it here

;; Configure package.el to include MELPA.
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)


;; Ensure that use-package is installed.
;;
;; If use-package isn't already installed, it's extremely likely that this is a
;; fresh installation! So we'll want to update the package repository and
;; install use-package before loading the literate configuration.
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(org-babel-load-file "~/.config/emacs/config.org")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e" "4990532659bb6a285fee01ede3dfa1b1bdf302c5c3c8de9fad9b6bc63a9252f7" "28a104f642d09d3e5c62ce3464ea2c143b9130167282ea97ddcc3607b381823f" "80214de566132bf2c844b9dee3ec0599f65c5a1f2d6ff21a2c8309e6e70f9242" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874" "dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9" default))
 '(package-selected-packages
   '(doom-modeline ansible-ls lsp-python-ms cape orderless corfu lsp-pyright company-box python-mode typescript-mode company company-mode lsp-ivy lsp-ui rainbow-mode highlight-indent-guides lsp-mode poet-theme which-key harpoon ivy-yasnippet org-roam vterm beacon org-appear yaml-mode mixed-pitch org-superstar window-move catppuccin-theme catppuccin evil-leader visual-fill-column ivy org-bullets evil-commentary doom-themes evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

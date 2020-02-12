;; slime
;; ~/.emacs.d/slimeをload-pathに追加
(add-to-list 'load-path (expand-file-name "~/.emacs.d/slime"))
;; Clozure CLをデフォルトのCommon Lisp処理系に設定
(setq inferior-lisp-program "/usr/local/bin/sbcl")
;; SLIMEのロード
(require 'slime)
(setq slime-contribs '(slime-fancy))
(slime-setup '(slime-repl slime-fancy slime-banner))

;; slime用の拡張
(install-elisp "https://github.com/m2ym/popwin-el/raw/master/popwin.el")
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
; display-buffer-functionを変更したくない
(setq special-display-function 'popwin:special-display-popup-window)
;; anything
(setq popwin:special-display-config '(("*scratch*")))
(display-buffer "*scratch*")
;; dired
(push '(dired-mode :position top) popwin:special-display-config)
(require 'dired-x)


;; https://qiita.com/yn01/items/b8d3dcb5be9078a6e27f
;; ロードパスの設定
(setq load-path (append
                  '(
                   ;"~/.emacs.d"
                   "~/.emacs.d/ruby"
                   "~/.emacs.d/python"
                   "~/.emacs.d/plugins"
                   "~/.emacs.d/melpa"
                   "~/.emacs.d/ext"
                   "~/.emacs.d/melpa/recipes"
                   "~/.emacs.d/slime"
		   "/usr/share/emacs/25.2/lisp/calendar"
		   "/usr/share/emacs/25.2/lisp/emacs-lisp"
		   "/usr/share/emacs/25.2/lisp"
		   "/usr/share/emacs/25.2/lisp/language"
		   "/usr/share/emacs/25.2/lisp/net"
		   "/usr/share/emacs/25.2/lisp/progmodes"
		   "/usr/share/emacs/25.2/lisp/url"
		   "/usr/share/emacs/25.2/lisp/gnus"
		   "/usr/share/emacs/25.2/lisp/mail"
		   ""
                  )))

;; ---------------------------------------------------------------------------
;; install-elisp
;; ---------------------------------------------------------------------------
;; emacsのwarning回避
(defun string-to-int (string &optional base)
    (floor (string-to-number string base)))
(require 'install-elisp)
(setq install-elisp-repository-directory "/usr/share/emacs/site-lisp/")


;; emacsのwarning回避
;(load "/Applications/Emacs.app/Contents/Resources/lisp/language/japan-util")
;; 環境を日本語、UTF-8にする
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; melpaの設定
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )
(package-initialize)
;; package管理
;; https://qiita.com/blue0513/items/ff8b5822701aeb2e9aae
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
;; cmdキーを superとして割り当てる
(setq mac-command-modifier 'super)


;; slime
(load "~/.emacs.d/slime-init")

;; https://qiita.com/tadsan/items/4ad2e5e3114fff172b6a
;; 新規ファイル作成
(load "~/.emacs.d/newfile")
;; 見た目の設定
(load "~/.emacs.d/set-display")
;; 起動はクールに
(load "~/.emacs.d/set-startup")
;; TabやSidebarのカスタム
;(load "~/.emacs.d/set-tabs")
;; 操作性の向上
(load "~/.emacs.d/set-usability")
;; ウィンドウ操作
(load "~/.emacs.d/set-windows-usability")
;; 検索性の向上
(load "~/.emacs.d/set-search")
;; ショートカット
(load "~/.emacs.d/set-shortcut")
;; Git
;; git-gutter-fringe
;(global-git-gutter-mode 1)
;; magit
;(global-set-key (kbd "C-c C-g") 'magit-diff-working-tree)
;; ファイル編集時に，bufferを再読込
;(global-auto-revert-mode 1)
;; ターミナル
;; eshell + shell-pop
(setq shell-pop-shell-type '("eshell" "*eshell*" (lambda () (eshell))))
(global-set-key (kbd "C-c o") 'shell-pop)


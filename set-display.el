;; font
;(add-to-list 'default-frame-alist '(font . "ricty-12"))

;; color theme
;(load-theme 'monokai-pro-theme t)

;; alpha
(if window-system 
    (progn
      (set-frame-parameter nil 'alpha 90)))

;; 非アクティブウィンドウの背景色を設定
;(require 'hiwin)
;(hiwin-activate)
;(set-face-background 'hiwin-face "gray30")

;; line numberの表示
(require 'linum)
(global-linum-mode 1)

;; tabサイズ
(setq default-tab-width 4)

;; メニューバーを非表示
(menu-bar-mode 0)

;; ツールバーを非表示
(tool-bar-mode 0)

;; default scroll bar消去
(scroll-bar-mode -1)

;; 現在ポイントがある関数名をモードラインに表示
(which-function-mode 1)

;; 対応する括弧をハイライト
(show-paren-mode 1)

;; リージョンのハイライト
(transient-mark-mode 1)

;; タイトルにフルパス表示
(setq frame-title-format "%f")

;;current directory 表示
(let ((ls (member 'mode-line-buffer-identification
                  mode-line-format)))
  (setcdr ls
    (cons '(:eval (concat " ("
            (abbreviate-file-name default-directory)
            ")"))
            (cdr ls))))
	    

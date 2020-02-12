(defun my/new-untitled-buffer ()
  "Create and switch to untitled buffer."
  (interactive)
  (switch-to-buffer (generate-new-buffer "Untitled")))


;; Alt+Shift+N に割り当てる
(global-set-key (kbd "C-N") 'my/new-untitled-buffer)


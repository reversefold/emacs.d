(setq delete-by-moving-to-trash nil)

(add-to-list 'load-path
             "~/.emacs.d/share/emacs/site-lisp")

(setq user-mail-address "jpatrin@lolapps.com"
      ;; See docs
      ;show-paren-style 'mixed
      ;; Set up my preferred window size and font.
      initial-frame-alist
      `((left . 0) (top . 0)
        (width . 250) (height . 60)
        ;; (font ;;
        ;; . "-apple-Monaco-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1")
        ;; Get list by doing M-x set-face-font RET default RET TAB TAB
        ;; which brings up a Completions buffer.
        (font . "-apple-Terminus-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1")
        (background-color . "#1D1E19")
        (foreground-color . "#D8D8D1")
       )
        ;(font . "-apple-Source_Code_Pro-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1"))

      ;; Apply window size and font to all subsequently-created frames.
      default-frame-alist initial-frame-alist
      ;; ERAU QSSI DLRO WEHT
      ;;windmove-wrap-around t
      ;; Use ssh for tramp
      tramp-default-method "ssh"
      ;; Turn off obnoxious bell
      ring-bell-function 'ignore)

;;; Trim whitespace from end of lines when saving.
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;;; Allow command-line clients to open files in GUI Emacs.
(setq server-use-tcp t)
(setq server-host "localhost")
(server-start)

;;; Automatically create directory trees for new files as needed.
(defun maybe-make-parent-dirs ()
  (or (file-exists-p (file-name-directory buffer-file-name))
      (make-directory (file-name-directory buffer-file-name) t)))
(if (fboundp 'maybe-make-parent-dirs)
    (add-hook 'before-save-hook 'maybe-make-parent-dirs))

;;; Load SMerge when needed
(defun sm-try-smerge ()
  (save-excursion
    (goto-char (point-min))
    (when (re-search-forward "^<<<<<<< " nil t)
      (smerge-mode 1))))
(add-hook 'find-file-hook 'sm-try-smerge t)

(require 'actionscript-mode)

(add-hook 'actionscript-mode-hook
          '(lambda ()
             (setq tab-width 4)))

;(require 'dsvn)

(desktop-save-mode 1)

(setq ido-use-filename-at-point nil)
(setq ido-use-url-at-point nil)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)

;(require 'pymacs)
;(pymacs-load "ropemacs" "rope-")

(setq ecb-tip-of-the-day nil)

(setq exec-path (append '("/Users/justin/bin" "/Applications/Emacs.app/Contents/MacOS/bin" "/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin" "/opt/local/sbin" "/opt/local/bin" "/usr/local/sbin" "/usr/local/share/python" "/usr/local/bin" "/Users/justin/Documents/flex_sdks/flex_sdk_4.1.0.16076/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/local/bin" "/usr/X11/bin" "/opt/local/Library/Frameworks/Python.framework/Versions/Current/bin" "/opt/local/bin" "/opt/local/sbin") exec-path))

(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
	   (local-file (file-relative-name
			temp-file
			(file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init))

;  (defun flymake-pylint-init ()
;    (let* ((temp-file (flymake-init-create-temp-buffer-copy
;                       'flymake-create-temp-inplace))
;           (local-file (file-relative-name
;                        temp-file
;                        (file-name-directory buffer-file-name))))
;      (list "epylint" (list local-file))))
;
;  (add-to-list 'flymake-allowed-file-name-masks
;               '("\\.py\\'" flymake-pylint-init))
  )

(add-hook 'find-file-hook 'flymake-find-file-hook)
;(load-library "flymake-cursor")

;;(require 'pysmell)
;;(add-hook 'python-mode-hook (lambda () (pysmell-mode 1)))

(load "~/.emacs.d/share/emacs/site-lisp/mmm-mako.el")

(add-to-list 'auto-mode-alist '("\\.mako\\'" . html-mode))
(mmm-add-mode-ext-class 'html-mode "\\.mako\\'" 'mako)

(add-to-list 'auto-mode-alist '("\\.pp\\'" . puppet-mode))

(setq puppet-indent-level 4)

(setq ropemacs-guess-project t)

(line-number-mode)
(column-number-mode)

;(setq tramp-default-proxies-alist
;      '(("target" nil "/ssh:proxy:")))

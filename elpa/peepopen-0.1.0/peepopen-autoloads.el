;;; peepopen-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (peepopen-bind-keys peepopen-goto-file-gui) "peepopen"
;;;;;;  "peepopen.el" (20172 14769))
;;; Generated autoloads from peepopen.el

(autoload 'peepopen-goto-file-gui "peepopen" "\
Uses external GUI app to quickly jump to a file in the project.

\(fn)" t nil)

(autoload 'peepopen-bind-keys "peepopen" "\


\(fn)" nil nil)

(add-hook 'textmate-mode-hook 'peepopen-bind-keys)

;;;***

;;;### (autoloads nil nil ("peepopen-pkg.el") (20172 14769 940029))

;;;***

(provide 'peepopen-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; peepopen-autoloads.el ends here

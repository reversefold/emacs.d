(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings starter-kit-eshell starter-kit-js
                                  scpaste clojure-mode clojure-test-mode markdown-mode yaml-mode tuareg marmalade
                                  magit anything anything-config anything-match-plugin anything-extension
                                  anything-ipython anything-complete ipython gist dired-single php-mode full-ack
                                  redo+ ecb csv-mode mode-compile find-file-in-git-repo idle-highlight-mode
                                  protobuf-mode json python nose python-pylint pyflakes pylint
                                  python-mode magithub desktop lua-mode elisp-cache dsvn crontab-mode ido-ubiquitous
                                  smart-tab flymake-shell flymake-jslint apache-mode doc-mode pymacs pysmell
                                  peepopen) ;magit-simple-keys 
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

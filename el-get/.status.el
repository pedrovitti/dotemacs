((ac-nrepl status "installed" recipe
	   (:name ac-nrepl :description "Nrepl completion source for Emacs auto-complete package" :type github :pkgname "purcell/ac-nrepl" :depends
		  (auto-complete nrepl)
		  :features ac-nrepl))
 (ace-jump-mode status "installed" recipe
		(:name ace-jump-mode :website "https://github.com/winterTTr/ace-jump-mode/wiki" :description "A quick cursor location minor mode for emacs" :type github :pkgname "winterTTr/ace-jump-mode" :features ace-jump-mode))
 (async status "installed" recipe
	(:name async :description "Simple library for asynchronous processing in Emacs" :type github :pkgname "jwiegley/emacs-async" :features async))
 (auto-complete status "installed" recipe
		(:name auto-complete :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
		       (popup fuzzy)))
 (base16-themes status "installed" recipe
		(:name base16-themes :description "Base16 provides carefully chosen syntax highlighting and a default set of sixteen colors suitable for a wide range of applications." :website "http://chriskempson.github.io/base16/" :type github :pkgname "neil477/base16-emacs" :post-init
		       (add-to-list 'custom-theme-load-path default-directory)))
 (clojure-mode status "installed" recipe
	       (:name clojure-mode :website "https://github.com/technomancy/clojure-mode" :description "Emacs support for the Clojure language." :type github :pkgname "technomancy/clojure-mode"))
 (coffee-mode status "installed" recipe
	      (:name coffee-mode :website "http://ozmm.org/posts/coffee_mode.html" :description "Emacs Major Mode for CoffeeScript" :type github :pkgname "defunkt/coffee-mode" :features coffee-mode :post-init
		     (progn
		       (add-to-list 'auto-mode-alist
				    '("\\.coffee$" . coffee-mode))
		       (add-to-list 'auto-mode-alist
				    '("Cakefile" . coffee-mode))
		       (setq coffee-js-mode 'javascript-mode))))
 (ctable status "installed" recipe
	 (:name ctable :description "Table Component for elisp" :type github :pkgname "kiwanami/emacs-ctable"))
 (deferred status "installed" recipe
   (:name deferred :description "Simple asynchronous functions for emacs lisp" :website "https://github.com/kiwanami/emacs-deferred" :type github :pkgname "kiwanami/emacs-deferred" :features "deferred"))
 (deft status "installed" recipe
   (:name deft :description "Deft is an Emacs mode for quickly browsing, filtering, and editing directories of plain text notes, inspired by Notational Velocity." :type http :url "http://jblevins.org/projects/deft/deft.el" :features deft))
 (dired-details status "installed" recipe
		(:name dired-details :description "Make file details hide-able in dired" :type emacswiki :features dired-details))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "4.stable" :pkgname "dimitri/el-get" :info "." :load "el-get.el"))
 (epc status "installed" recipe
      (:name epc :description "An RPC stack for Emacs Lisp" :type github :pkgname "kiwanami/emacs-epc" :depends
	     (deferred ctable)))
 (expand-region status "installed" recipe
		(:name expand-region :type github :pkgname "magnars/expand-region.el" :description "Expand region increases the selected region by semantic units. Just keep pressing the key until it selects what you want." :website "https://github.com/magnars/expand-region.el#readme" :features expand-region))
 (full-ack status "installed" recipe
	   (:name full-ack :description "A front-end for ack" :type github :pkgname "nschum/full-ack" :prepare
		  (progn
		    (autoload 'ack "full-ack" nil t)
		    (autoload 'ack-find-file "full-ack" nil t)
		    (autoload 'ack-find-same-file "full-ack" nil t)
		    (autoload 'ack-same "full-ack" nil t))))
 (fuzzy status "installed" recipe
	(:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (gh status "installed" recipe
     (:name gh :type github :pkgname "sigma/gh.el" :depends
	    (pcache logito)
	    :description "Github API client libraries" :website "http://github.com/sigma/gh.el"))
 (gist status "installed" recipe
       (:name gist :type github :pkgname "defunkt/gist.el" :depends
	      (gh tabulated-list)
	      :description "Emacs integration for gist.github.com" :website "http://github.com/defunkt/gist.el"))
 (jedi status "installed" recipe
       (:name jedi :description "An awesome Python auto-completion for Emacs" :type github :pkgname "tkf/emacs-jedi" :build
	      (("PYTHON=python2" "make" "requirements"))
	      :submodule nil :depends
	      (epc auto-complete)))
 (jquery-doc status "installed" recipe
	     (:name jquery-doc :description "jQuery api documentation interface for emacs" :website "https://github.com/ananthakumaran/jquery-doc.el" :type github :pkgname "ananthakumaran/jquery-doc.el" :features "jquery-doc" :depends auto-complete))
 (logito status "installed" recipe
	 (:name logito :type github :pkgname "sigma/logito" :description "logging library for Emacs" :website "http://github.com/sigma/logito"))
 (lua-mode status "installed" recipe
	   (:name lua-mode :description "A major-mode for editing Lua scripts" :website "https://github.com/immerrr/lua-mode" :type git :url "https://github.com/immerrr/lua-mode"))
 (magit status "installed" recipe
	(:name magit :website "https://github.com/magit/magit#readme" :description "It's Magit! An Emacs mode for Git." :type github :pkgname "magit/magit" :info "." :build
	       (if
		   (version-list-<=
		    (version-to-list "24.3")
		    (version-to-list emacs-version))
		   `(("make" ,(format "EMACS=%s" el-get-emacs)
		      "all"))
		 `(("make" ,(format "EMACS=%s" el-get-emacs)
		    "docs")))
	       :build/berkeley-unix
	       (("touch" "`find . -name Makefile`")
		("gmake"))))
 (markdown-mode status "installed" recipe
		(:name markdown-mode :description "Major mode to edit Markdown files in Emacs" :type git :url "git://jblevins.org/git/markdown-mode.git" :before
		       (add-to-list 'auto-mode-alist
				    '("\\.\\(md\\|mdown\\|markdown\\)\\'" . markdown-mode))))
 (mu4e status "required" recipe nil)
 (multi-web-mode status "installed" recipe
		 (:name "multi-web-mode" :description "Multi Web Mode is a minor mode which makes web editing in Emacs much easier" :type github :pkgname "fgallina/multi-web-mode"))
 (multiple-cursors status "installed" recipe
		   (:name multiple-cursors :description "An experiment in adding multiple cursors to emacs" :type github :pkgname "magnars/multiple-cursors.el" :features multiple-cursors))
 (nrepl status "installed" recipe
	(:name nrepl :description "An Emacs client for nREPL, the Clojure networked REPL server." :type github :pkgname "kingtim/nrepl.el" :depends clojure-mode))
 (package status "installed" recipe
	  (:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin "24" :type http :url "http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el" :shallow nil :features package :post-init
		 (progn
		   (setq package-user-dir
			 (expand-file-name
			  (convert-standard-filename
			   (concat
			    (file-name-as-directory default-directory)
			    "elpa")))
			 package-directory-list
			 (list
			  (file-name-as-directory package-user-dir)
			  "/usr/share/emacs/site-lisp/elpa/"))
		   (make-directory package-user-dir t)
		   (unless
		       (boundp 'package-subdirectory-regexp)
		     (defconst package-subdirectory-regexp "^\\([^.].*\\)-\\([0-9]+\\(?:[.][0-9]+\\)*\\)$" "Regular expression matching the name of\n a package subdirectory. The first subexpression is the package\n name. The second subexpression is the version string."))
		   (setq package-archives
			 '(("ELPA" . "http://tromey.com/elpa/")
			   ("gnu" . "http://elpa.gnu.org/packages/")
			   ("marmalade" . "http://marmalade-repo.org/packages/")
			   ("SC" . "http://joseito.republika.pl/sunrise-commander/"))))))
 (paredit status "installed" recipe
	  (:name paredit :description "Minor mode for editing parentheses" :type http :prepare
		 (progn
		   (autoload 'enable-paredit-mode "paredit")
		   (autoload 'disable-paredit-mode "paredit"))
		 :url "http://mumble.net/~campbell/emacs/paredit.el"))
 (pcache status "installed" recipe
	 (:name pcache :type github :pkgname "sigma/pcache" :description "persistent caching for Emacs" :website "http://github.com/sigma/pcache"))
 (php-mode-improved status "installed" recipe
		    (:name php-mode-improved :description "Major mode for editing PHP code. This is a version of the php-mode from http://php-mode.sourceforge.net that fixes a few bugs which make using php-mode much more palatable" :type emacswiki :load
			   ("php-mode-improved.el")
			   :features php-mode))
 (popup status "installed" recipe
	(:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :pkgname "auto-complete/popup-el"))
 (python status "installed" recipe
	 (:name python :description "Python's flying circus support for Emacs" :type github :branch "emacs-24" :pkgname "fgallina/python.el"))
 (python-django status "installed" recipe
		(:name python-django :description "An Emacs package for managing Django projects" :type github :pkgname "fgallina/python-django.el" :features python-django))
 (rainbow-mode status "installed" recipe
	       (:name rainbow-mode :description "Colorize color names in buffers" :minimum-emacs-version 24 :type elpa))
 (region-bindings-mode status "installed" recipe
		       (:name region-bindings-mode :description "A minor mode that enables custom bindings when mark is active." :type github :pkgname "fgallina/region-bindings-mode" :features region-bindings-mode))
 (scss-mode status "installed" recipe
	    (:name scss-mode :description "Major mode for editing SCSS files(http://sass-lang.com)" :type github :pkgname "antonj/scss-mode" :features scss-mode))
 (smart-tab status "installed" recipe
	    (:name smart-tab :description "Intelligent tab completion and indentation." :type github :pkgname "genehack/smart-tab" :features smart-tab))
 (smex status "installed" recipe
       (:name smex :description "M-x interface with Ido-style fuzzy matching." :type github :pkgname "nonsequitur/smex" :features smex :post-init
	      (smex-initialize)))
 (startupd status "installed" recipe
	   (:name startupd :description "Modular loading of Emacs configuration" :type github :pkgname "fgallina/startupd.el" :features startupd))
 (tabulated-list status "installed" recipe
		 (:name tabulated-list :type github :pkgname "sigma/tabulated-list.el" :description "generic major mode for tabulated lists." :website "http://github.com/sigma/tabulated-list.el"))
 (undo-tree status "installed" recipe
	    (:name undo-tree :description "Treat undo history as a tree" :type github :pkgname "emacsmirror/undo-tree" :prepare
		   (progn
		     (autoload 'undo-tree-mode "undo-tree.el" "Undo tree mode; see undo-tree.el for details" t)
		     (autoload 'global-undo-tree-mode "undo-tree.el" "Global undo tree mode" t))))
 (yaml-mode status "installed" recipe
	    (:name yaml-mode :description "Simple major mode to edit YAML file for emacs" :type github :pkgname "yoshiki/yaml-mode"))
 (yasnippet status "installed" recipe
	    (:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :features "yasnippet" :pre-init
		   (unless
		       (or
			(boundp 'yas/snippet-dirs)
			(get 'yas/snippet-dirs 'customized-value))
		     (setq yas/snippet-dirs
			   (list
			    (concat el-get-dir
				    (file-name-as-directory "yasnippet")
				    "snippets"))))
		   :post-init
		   (put 'yas/snippet-dirs 'standard-value
			(list
			 (list 'quote
			       (list
				(concat el-get-dir
					(file-name-as-directory "yasnippet")
					"snippets")))))
		   :compile nil :submodule nil))
 (zencoding-mode status "installed" recipe
		 (:name zencoding-mode :description "Unfold CSS-selector-like expressions to markup" :type github :pkgname "rooney/zencoding" :features zencoding-mode)))

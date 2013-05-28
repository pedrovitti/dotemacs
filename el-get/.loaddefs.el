;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (ac-nrepl-popup-doc ac-nrepl-setup) "ac-nrepl/ac-nrepl"
;;;;;;  "ac-nrepl/ac-nrepl.el" (20883 62838 0 0))
;;; Generated autoloads from ac-nrepl/ac-nrepl.el

(add-hook 'nrepl-connected-hook 'ac-nrepl-refresh-class-cache t)

(defface ac-nrepl-candidate-face '((t (:inherit ac-candidate-face))) "\
Face for nrepl candidates." :group (quote auto-complete))

(defface ac-nrepl-selection-face '((t (:inherit ac-selection-face))) "\
Face for the nrepl selected candidate." :group (quote auto-complete))

(defconst ac-nrepl-source-defaults '((available . ac-nrepl-available-p) (candidate-face . ac-nrepl-candidate-face) (selection-face . ac-nrepl-selection-face) (prefix . ac-nrepl-symbol-start-pos) (document . ac-nrepl-documentation)) "\
Defaults common to the various completion sources.")

(defvar ac-source-nrepl-ns (append '((candidates . ac-nrepl-candidates-ns) (symbol . "n")) ac-nrepl-source-defaults) "\
Auto-complete source for nrepl ns completion.")

(defvar ac-source-nrepl-vars (append '((candidates . ac-nrepl-candidates-vars) (symbol . "v")) ac-nrepl-source-defaults) "\
Auto-complete source for nrepl var completion.")

(defvar ac-source-nrepl-ns-classes (append '((candidates . ac-nrepl-candidates-ns-classes) (symbol . "c")) ac-nrepl-source-defaults) "\
Auto-complete source for nrepl ns-specific class completion.")

(defvar ac-source-nrepl-all-classes (append '((candidates . ac-nrepl-candidates-all-classes) (symbol . "c")) ac-nrepl-source-defaults) "\
Auto-complete source for nrepl all class completion.")

(defvar ac-source-nrepl-java-methods (append '((candidates . ac-nrepl-candidates-java-methods) (symbol . "m") (action . ac-nrepl-delete-java-class-hint)) ac-nrepl-source-defaults) "\
Auto-complete source for nrepl java method completion.")

(defvar ac-source-nrepl-static-methods (append '((candidates . ac-nrepl-candidates-static-methods) (symbol . "s")) ac-nrepl-source-defaults) "\
Auto-complete source for nrepl java static method completion.")

(autoload 'ac-nrepl-setup "ac-nrepl/ac-nrepl" "\
Add the nrepl completion source to the front of `ac-sources'.
This affects only the current buffer.

\(fn)" t nil)

(autoload 'ac-nrepl-popup-doc "ac-nrepl/ac-nrepl" "\
A popup alternative to `nrepl-doc'.

\(fn)" t nil)

;;;***

;;;### (autoloads (ace-jump-mode ace-jump-line-mode ace-jump-word-mode
;;;;;;  ace-jump-char-mode ace-jump-mode-pop-mark) "ace-jump-mode/ace-jump-mode"
;;;;;;  "ace-jump-mode/ace-jump-mode.el" (20883 62783 0 0))
;;; Generated autoloads from ace-jump-mode/ace-jump-mode.el

(autoload 'ace-jump-mode-pop-mark "ace-jump-mode/ace-jump-mode" "\
Pop up a postion from `ace-jump-mode-mark-ring', and jump back to that position

\(fn)" t nil)

(autoload 'ace-jump-char-mode "ace-jump-mode/ace-jump-mode" "\
AceJump char mode

\(fn QUERY-CHAR)" t nil)

(autoload 'ace-jump-word-mode "ace-jump-mode/ace-jump-mode" "\
AceJump word mode.
You can set `ace-jump-word-mode-use-query-char' to nil to prevent
asking for a head char, that will mark all the word in current
buffer.

\(fn HEAD-CHAR)" t nil)

(autoload 'ace-jump-line-mode "ace-jump-mode/ace-jump-mode" "\
AceJump line mode.
Marked each no empty line and move there

\(fn)" t nil)

(autoload 'ace-jump-mode "ace-jump-mode/ace-jump-mode" "\
AceJump mode is a minor mode for you to quick jump to a
position in the curret view.
   There is three submode now:
     `ace-jump-char-mode'
     `ace-jump-word-mode'
     `ace-jump-line-mode'

You can specify the sequence about which mode should enter
by customize `ace-jump-mode-submode-list'.

If you do not want to query char for word mode, you can change
`ace-jump-word-mode-use-query-char' to nil.

If you don't like the default move keys, you can change it by
setting `ace-jump-mode-move-keys'.

You can constrol whether use the case sensitive via
`ace-jump-mode-case-fold'.

\(fn &optional PREFIX)" t nil)

;;;***

;;;### (autoloads (async-start async-start-process) "async/async"
;;;;;;  "async/async.el" (20883 62785 0 0))
;;; Generated autoloads from async/async.el

(autoload 'async-start-process "async/async" "\
Start the executable PROGRAM asynchronously.  See `async-start'.
PROGRAM is passed PROGRAM-ARGS, calling FINISH-FUNC with the
process object when done.  If FINISH-FUNC is nil, the future
object will return the process object when the program is
finished.

\(fn NAME PROGRAM FINISH-FUNC &rest PROGRAM-ARGS)" nil nil)

(autoload 'async-start "async/async" "\
Execute START-FUNC (often a lambda) in a subordinate Emacs process.
When done, the return value is passed to FINISH-FUNC.  Example:

    (async-start
       ;; What to do in the child process
       (lambda ()
         (message \"This is a test\")
         (sleep-for 3)
         222)

       ;; What to do when it finishes
       (lambda (result)
         (message \"Async process done, result should be 222: %s\"
                  result)))

If FINISH-FUNC is nil or missing, a future is returned that can
be inspected using `async-get', blocking until the value is
ready.  Example:

    (let ((proc (async-start
                   ;; What to do in the child process
                   (lambda ()
                     (message \"This is a test\")
                     (sleep-for 3)
                     222))))

        (message \"I'm going to do some work here\") ;; ....

        (message \"Waiting on async process, result should be 222: %s\"
                 (async-get proc)))

If you don't want to use a callback, and you don't care about any
return value form the child process, pass the `ignore' symbol as
the second argument (if you don't, and never call `async-get', it
will leave *emacs* process buffers hanging around):

    (async-start
     (lambda ()
       (delete-file \"a remote file on a slow link\" nil))
     'ignore)

Note: Even when FINISH-FUNC is present, a future is still
returned except that it yields no value (since the value is
passed to FINISH-FUNC).  Call `async-get' on such a future always
returns nil.  It can still be useful, however, as an argument to
`async-ready' or `async-wait'.

\(fn START-FUNC &optional FINISH-FUNC)" nil t)

;;;***

;;;### (autoloads (auto-complete) "auto-complete/auto-complete" "auto-complete/auto-complete.el"
;;;;;;  (20883 62806 0 0))
;;; Generated autoloads from auto-complete/auto-complete.el

(autoload 'auto-complete "auto-complete/auto-complete" "\
Start auto-completion at current point.

\(fn &optional SOURCES)" t nil)

;;;***

;;;### (autoloads (clojure-mode) "clojure-mode/clojure-mode" "clojure-mode/clojure-mode.el"
;;;;;;  (20883 62830 0 0))
;;; Generated autoloads from clojure-mode/clojure-mode.el

(autoload 'clojure-mode "clojure-mode/clojure-mode" "\
Major mode for editing Clojure code - similar to Lisp mode.
Commands:
Delete converts tabs to spaces as it moves back.
Blank lines separate paragraphs.  Semicolons start comments.
\\{clojure-mode-map}
Note that `run-lisp' may be used either to start an inferior Lisp job
or to switch back to an existing one.

Entry to this mode calls the value of `clojure-mode-hook'
if that value is non-nil.

\(fn)" t nil)

(put 'clojure-test-ns-segment-position 'safe-local-variable 'integerp)

(put 'clojure-mode-load-command 'safe-local-variable 'stringp)

(add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))

(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojure-mode))

(add-to-list 'auto-mode-alist '("\\.dtm\\'" . clojure-mode))

(add-to-list 'auto-mode-alist '("\\.edn\\'" . clojure-mode))

(add-to-list 'interpreter-mode-alist '("jark" . clojure-mode))

(add-to-list 'interpreter-mode-alist '("cake" . clojure-mode))

;;;***

;;;### (autoloads (clojure-test-mode) "clojure-mode/clojure-test-mode"
;;;;;;  "clojure-mode/clojure-test-mode.el" (20883 62830 0 0))
;;; Generated autoloads from clojure-mode/clojure-test-mode.el

(autoload 'clojure-test-mode "clojure-mode/clojure-test-mode" "\
A minor mode for running Clojure tests.

\\{clojure-test-mode-map}

\(fn &optional ARG)" t nil)

(defun clojure-test-maybe-enable nil "\
Enable clojure-test-mode if the current buffer contains a namespace
with a \"test.\" bit on it." (let ((ns (clojure-find-package))) (when (and ns (string-match "test\\(\\.\\|$\\)" ns)) (save-window-excursion (clojure-test-mode t)))))

(add-hook 'clojure-mode-hook 'clojure-test-maybe-enable)

;;;***

;;;### (autoloads (coffee-mode) "coffee-mode/coffee-mode" "coffee-mode/coffee-mode.el"
;;;;;;  (20883 62936 0 0))
;;; Generated autoloads from coffee-mode/coffee-mode.el

(autoload 'coffee-mode "coffee-mode/coffee-mode" "\
Major mode for editing CoffeeScript.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.coffee\\'" . coffee-mode))

(add-to-list 'auto-mode-alist '("\\.iced\\'" . coffee-mode))

(add-to-list 'auto-mode-alist '("Cakefile\\'" . coffee-mode))

(add-to-list 'interpreter-mode-alist '("coffee" . coffee-mode))

;;;***

;;;### (autoloads (deft deft-new-file) "deft/deft" "deft/deft.el"
;;;;;;  (20883 62938 0 0))
;;; Generated autoloads from deft/deft.el

(autoload 'deft-new-file "deft/deft" "\
Create a new file quickly.
Use either an automatically generated filename or the filter
string if non-nil and `deft-use-filename-as-title' is set.  If the
filter string is non-nil and title is not from filename, use it
as the title.

\(fn)" t nil)

(autoload 'deft "deft/deft" "\
Switch to *Deft* buffer and load files.

\(fn)" t nil)

;;;***

;;;### (autoloads (el-get-checksum el-get-make-recipes el-get-cd
;;;;;;  el-get-self-update el-get-update-all el-get-version) "el-get/el-get"
;;;;;;  "el-get/el-get.el" (20883 62636 0 0))
;;; Generated autoloads from el-get/el-get.el

(autoload 'el-get-version "el-get/el-get" "\
Message the current el-get version

\(fn)" t nil)

(autoload 'el-get-update-all "el-get/el-get" "\
Performs update of all installed packages.

\(fn &optional NO-PROMPT)" t nil)

(autoload 'el-get-self-update "el-get/el-get" "\
Update el-get itself.  The standard recipe takes care of reloading the code.

\(fn)" t nil)

(autoload 'el-get-cd "el-get/el-get" "\
Open dired in the package directory.

\(fn PACKAGE)" t nil)

(autoload 'el-get-make-recipes "el-get/el-get" "\
Loop over `el-get-sources' and write a recipe file for each
entry which is not a symbol and is not already a known recipe.

\(fn &optional DIR)" t nil)

(autoload 'el-get-checksum "el-get/el-get" "\
Compute the checksum of the given package, and put it in the kill-ring

\(fn PACKAGE &optional PACKAGE-STATUS-ALIST)" t nil)

;;;***

;;;### (autoloads (el-get-list-packages) "el-get/el-get-list-packages"
;;;;;;  "el-get/el-get-list-packages.el" (20883 62636 0 0))
;;; Generated autoloads from el-get/el-get-list-packages.el

(autoload 'el-get-list-packages "el-get/el-get-list-packages" "\
Display a list of packages.

\(fn)" t nil)

;;;***

;;;### (autoloads (er/expand-region) "expand-region/expand-region"
;;;;;;  "expand-region/expand-region.el" (20883 62943 0 0))
;;; Generated autoloads from expand-region/expand-region.el

(autoload 'er/expand-region "expand-region/expand-region" "\
Increase selected region by semantic units.

With prefix argument expands the region that many times.
If prefix argument is negative calls `er/contract-region'.
If prefix argument is 0 it resets point and mark to their state
before calling `er/expand-region' for the first time.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads (expand-region-exclude-text-mode-expansions expand-region-reset-fast-key
;;;;;;  expand-region-contract-fast-key expand-region-fast-keys-enabled
;;;;;;  expand-region-skip-whitespace expand-region-autocopy-register
;;;;;;  expand-region-guess-python-mode expand-region-preferred-python-mode
;;;;;;  expand-region) "expand-region/expand-region-custom" "expand-region/expand-region-custom.el"
;;;;;;  (20883 62943 0 0))
;;; Generated autoloads from expand-region/expand-region-custom.el

(let ((loads (get 'expand-region 'custom-loads))) (if (member '"expand-region/expand-region-custom" loads) nil (put 'expand-region 'custom-loads (cons '"expand-region/expand-region-custom" loads))))

(defvar expand-region-preferred-python-mode 'python "\
The name of your preferred python mode")

(custom-autoload 'expand-region-preferred-python-mode "expand-region/expand-region-custom" t)

(defvar expand-region-guess-python-mode t "\
If expand-region should attempt to guess your preferred python mode")

(custom-autoload 'expand-region-guess-python-mode "expand-region/expand-region-custom" t)

(defvar expand-region-autocopy-register "" "\
If set to a string of a single character (try \"e\"), then the
contents of the most recent expand or contract command will
always be copied to the register named after that character.")

(custom-autoload 'expand-region-autocopy-register "expand-region/expand-region-custom" t)

(defvar expand-region-skip-whitespace t "\
If expand-region should skip past whitespace on initial expansion")

(custom-autoload 'expand-region-skip-whitespace "expand-region/expand-region-custom" t)

(defvar expand-region-fast-keys-enabled t "\
If expand-region should bind fast keys after initial expand/contract")

(custom-autoload 'expand-region-fast-keys-enabled "expand-region/expand-region-custom" t)

(defvar expand-region-contract-fast-key "-" "\
Key to use after an initial expand/contract to contract once more.")

(custom-autoload 'expand-region-contract-fast-key "expand-region/expand-region-custom" t)

(defvar expand-region-reset-fast-key "0" "\
Key to use after an initial expand/contract to undo.")

(custom-autoload 'expand-region-reset-fast-key "expand-region/expand-region-custom" t)

(defvar expand-region-exclude-text-mode-expansions '(html-mode nxml-mode) "\
List of modes which derive from `text-mode' for which text mode expansions are not appropriate.")

(custom-autoload 'expand-region-exclude-text-mode-expansions "expand-region/expand-region-custom" t)

;;;***

;;;### (autoloads (ack-find-file ack-find-same-file ack ack-same)
;;;;;;  "full-ack/full-ack" "full-ack/full-ack.el" (20883 62945 0
;;;;;;  0))
;;; Generated autoloads from full-ack/full-ack.el

(autoload 'ack-same "full-ack/full-ack" "\
Run ack with --type matching the current `major-mode'.
The types of files searched are determined by `ack-mode-type-alist' and
`ack-mode-extension-alist'.  If no type is configured the buffer's file
extension is used for the search.
PATTERN is interpreted as a regular expression, iff REGEXP is non-nil.  If
called interactively, the value of REGEXP is determined by `ack-search-regexp'.
A prefix arg toggles that value.
DIRECTORY is the root directory.  If called interactively, it is determined by
`ack-project-root-file-patterns'.  The user is only prompted, if
`ack-prompt-for-directory' is set.

\(fn PATTERN &optional REGEXP DIRECTORY)" t nil)

(autoload 'ack "full-ack/full-ack" "\
Run ack.
PATTERN is interpreted as a regular expression, iff REGEXP is non-nil.  If
called interactively, the value of REGEXP is determined by `ack-search-regexp'.
A prefix arg toggles that value.
DIRECTORY is the root directory.  If called interactively, it is determined by
`ack-project-root-file-patterns'.  The user is only prompted, if
`ack-prompt-for-directory' is set.

\(fn PATTERN &optional REGEXP DIRECTORY)" t nil)

(autoload 'ack-find-same-file "full-ack/full-ack" "\
Prompt to find a file found by ack in DIRECTORY.

\(fn &optional DIRECTORY)" t nil)

(autoload 'ack-find-file "full-ack/full-ack" "\
Prompt to find a file found by ack in DIRECTORY.

\(fn &optional DIRECTORY)" t nil)

;;;***

;;;### (autoloads (gh-api-v3 gh-api) "gh/gh-api" "gh/gh-api.el" (20883
;;;;;;  62953 0 0))
;;; Generated autoloads from gh/gh-api.el

(require 'eieio)

(eieio-defclass-autoload 'gh-api 'nil "gh/gh-api" "Github API")

(eieio-defclass-autoload 'gh-api-v3 '(gh-api) "gh/gh-api" "Github API v3")

;;;***

;;;### (autoloads (gh-oauth-authenticator gh-password-authenticator
;;;;;;  gh-authenticator) "gh/gh-auth" "gh/gh-auth.el" (20883 62953
;;;;;;  0 0))
;;; Generated autoloads from gh/gh-auth.el

(require 'eieio)

(eieio-defclass-autoload 'gh-authenticator 'nil "gh/gh-auth" "Abstract authenticator")

(eieio-defclass-autoload 'gh-password-authenticator '(gh-authenticator) "gh/gh-auth" "Password-based authenticator")

(eieio-defclass-autoload 'gh-oauth-authenticator '(gh-authenticator) "gh/gh-auth" "Oauth-based authenticator")

;;;***

;;;### (autoloads nil "gh/gh-cache" "gh/gh-cache.el" (20883 62953
;;;;;;  0 0))
;;; Generated autoloads from gh/gh-cache.el

(require 'eieio)

;;;***

;;;### (autoloads nil "gh/gh-common" "gh/gh-common.el" (20883 62953
;;;;;;  0 0))
;;; Generated autoloads from gh/gh-common.el

(require 'eieio)

;;;***

;;;### (autoloads (gh-gist-gist gh-gist-gist-stub gh-gist-api) "gh/gh-gist"
;;;;;;  "gh/gh-gist.el" (20883 62953 0 0))
;;; Generated autoloads from gh/gh-gist.el

(require 'eieio)

(eieio-defclass-autoload 'gh-gist-api '(gh-api-v3) "gh/gh-gist" "Gist API")

(eieio-defclass-autoload 'gh-gist-gist-stub '(gh-object) "gh/gh-gist" "Class for user-created gist objects")

(eieio-defclass-autoload 'gh-gist-gist '(gh-gist-gist-stub) "gh/gh-gist" "Gist object")

;;;***

;;;### (autoloads nil "gh/gh-issues" "gh/gh-issues.el" (20883 62953
;;;;;;  0 0))
;;; Generated autoloads from gh/gh-issues.el

(require 'eieio)

;;;***

;;;### (autoloads (gh-oauth-api) "gh/gh-oauth" "gh/gh-oauth.el" (20883
;;;;;;  62953 0 0))
;;; Generated autoloads from gh/gh-oauth.el

(require 'eieio)

(eieio-defclass-autoload 'gh-oauth-api '(gh-api-v3) "gh/gh-oauth" "OAuth API")

;;;***

;;;### (autoloads (gh-orgs-org-stub gh-orgs-api) "gh/gh-orgs" "gh/gh-orgs.el"
;;;;;;  (20883 62953 0 0))
;;; Generated autoloads from gh/gh-orgs.el

(require 'eieio)

(eieio-defclass-autoload 'gh-orgs-api '(gh-api-v3) "gh/gh-orgs" "Orgs API")

(eieio-defclass-autoload 'gh-orgs-org-stub '(gh-object) "gh/gh-orgs" nil)

;;;***

;;;### (autoloads (gh-pulls-request gh-pulls-api) "gh/gh-pulls" "gh/gh-pulls.el"
;;;;;;  (20883 62953 0 0))
;;; Generated autoloads from gh/gh-pulls.el

(require 'eieio)

(eieio-defclass-autoload 'gh-pulls-api '(gh-api-v3) "gh/gh-pulls" "Git pull requests API")

(eieio-defclass-autoload 'gh-pulls-request '(gh-pulls-request-stub) "gh/gh-pulls" "Git pull requests API")

;;;***

;;;### (autoloads (gh-repos-repo gh-repos-repo-stub gh-repos-api)
;;;;;;  "gh/gh-repos" "gh/gh-repos.el" (20883 62953 0 0))
;;; Generated autoloads from gh/gh-repos.el

(require 'eieio)

(eieio-defclass-autoload 'gh-repos-api '(gh-api-v3) "gh/gh-repos" "Repos API")

(eieio-defclass-autoload 'gh-repos-repo-stub '(gh-object) "gh/gh-repos" "Class for user-created repository objects")

(eieio-defclass-autoload 'gh-repos-repo '(gh-repos-repo-stub) "gh/gh-repos" "Class for GitHub repositories")

;;;***

;;;### (autoloads nil "gh/gh-url" "gh/gh-url.el" (20883 62953 0 0))
;;; Generated autoloads from gh/gh-url.el

(require 'eieio)

;;;***

;;;### (autoloads (gist-fetch gist-list gist-region-or-buffer-private
;;;;;;  gist-region-or-buffer gist-buffer-private gist-buffer gist-region-private
;;;;;;  gist-region) "gist/gist" "gist/gist.el" (20883 62962 0 0))
;;; Generated autoloads from gist/gist.el

(autoload 'gist-region "gist/gist" "\
Post the current region as a new paste at gist.github.com
Copies the URL into the kill ring.

With a prefix argument, makes a private paste.

\(fn BEGIN END &optional PRIVATE CALLBACK)" t nil)

(autoload 'gist-region-private "gist/gist" "\
Post the current region as a new private paste at gist.github.com
Copies the URL into the kill ring.

\(fn BEGIN END)" t nil)

(autoload 'gist-buffer "gist/gist" "\
Post the current buffer as a new paste at gist.github.com.
Copies the URL into the kill ring.

With a prefix argument, makes a private paste.

\(fn &optional PRIVATE)" t nil)

(autoload 'gist-buffer-private "gist/gist" "\
Post the current buffer as a new private paste at gist.github.com.
Copies the URL into the kill ring.

\(fn)" t nil)

(autoload 'gist-region-or-buffer "gist/gist" "\
Post either the current region, or if mark is not set, the
  current buffer as a new paste at gist.github.com

Copies the URL into the kill ring.

With a prefix argument, makes a private paste.

\(fn &optional PRIVATE)" t nil)

(autoload 'gist-region-or-buffer-private "gist/gist" "\
Post either the current region, or if mark is not set, the
  current buffer as a new private paste at gist.github.com

Copies the URL into the kill ring.

\(fn)" t nil)

(autoload 'gist-list "gist/gist" "\
Displays a list of all of the current user's gists in a new buffer.

\(fn &optional FORCE-RELOAD BACKGROUND)" t nil)

(autoload 'gist-fetch "gist/gist" "\


\(fn ID)" t nil)

;;;***

;;;### (autoloads (jedi:setup anything-jedi-related-names helm-jedi-related-names
;;;;;;  jedi:ac-setup jedi:complete jedi:start-dedicated-server)
;;;;;;  "jedi/jedi" "jedi/jedi.el" (20883 62976 0 0))
;;; Generated autoloads from jedi/jedi.el

(autoload 'jedi:start-dedicated-server "jedi/jedi" "\
Start Jedi server dedicated to this buffer.
This is useful, for example, when you want to use different
`sys.path' for some buffer.  When invoked as an interactive
command, it asks you how to start the Jedi server.  You can edit
the command in minibuffer to specify the way Jedi server run.

If you want to setup how Jedi server is started programmatically
per-buffer/per-project basis, make `jedi:server-command' and
`jedi:server-args' buffer local and set it in `python-mode-hook'.
See also: `jedi:server-args'.

\(fn COMMAND)" t nil)

(autoload 'jedi:complete "jedi/jedi" "\
Complete code at point.

\(fn &key (expand ac-expand-on-auto-complete))" t nil)

(autoload 'jedi:ac-setup "jedi/jedi" "\
Add Jedi AC sources to `ac-sources'.

\(fn)" t nil)

(autoload 'helm-jedi-related-names "jedi/jedi" "\
Find related names of the object at point using `helm' interface.

\(fn)" t nil)

(autoload 'anything-jedi-related-names "jedi/jedi" "\
Find related names of the object at point using `anything' interface.

\(fn)" t nil)

(autoload 'jedi:setup "jedi/jedi" "\
Fully setup jedi.el for current buffer.
It setups `ac-sources' (calls `jedi:ac-setup') and turns
`jedi-mode' on.

This function is intended to be called from `python-mode-hook',
like this::

       (add-hook 'python-mode-hook 'jedi:setup)

You can also call this function as a command, to quickly test
what jedi can do.

\(fn)" t nil)

;;;***

;;;### (autoloads (company-jquery jquery-doc-ac-prefix) "jquery-doc/jquery-doc"
;;;;;;  "jquery-doc/jquery-doc.el" (20883 62824 0 0))
;;; Generated autoloads from jquery-doc/jquery-doc.el

(autoload 'jquery-doc-ac-prefix "jquery-doc/jquery-doc" "\


\(fn)" nil nil)

(defvar ac-source-jquery '((candidates . jquery-doc-methods) (symbol . "f") (document . jquery-doc-documentation) (prefix . jquery-doc-ac-prefix) (cache)))

(autoload 'company-jquery "jquery-doc/jquery-doc" "\
`company-mode' completion back-end using `jquery-doc'.

\(fn COMMAND &optional ARG &rest IGNORE)" t nil)

;;;***

;;;### (autoloads (lua-mode) "lua-mode/lua-mode" "lua-mode/lua-mode.el"
;;;;;;  (20883 62999 0 0))
;;; Generated autoloads from lua-mode/lua-mode.el

(autoload 'lua-mode "lua-mode/lua-mode" "\
Major mode for editing Lua code.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))

(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;;;***

;;;### (autoloads (magit-status) "magit/magit" "magit/magit.el" (20883
;;;;;;  63023 0 0))
;;; Generated autoloads from magit/magit.el

(autoload 'magit-status "magit/magit" "\
Open a Magit status buffer for the Git repository containing DIR.
If DIR is not within a Git repository, offer to create a Git
repository in DIR.

Interactively, a prefix argument means to ask the user which Git
repository to use even if `default-directory' is under Git
control.  Two prefix arguments means to ignore `magit-repo-dirs'
when asking for user input.

\(fn DIR)" t nil)

;;;***

;;;### (autoloads (magit-blame-mode) "magit/magit-blame" "magit/magit-blame.el"
;;;;;;  (20883 63023 0 0))
;;; Generated autoloads from magit/magit-blame.el

(autoload 'magit-blame-mode "magit/magit-blame" "\
Display blame information inline.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (turn-on-magit-flow magit-flow-mode) "magit/magit-flow"
;;;;;;  "magit/magit-flow.el" (20883 63023 0 0))
;;; Generated autoloads from magit/magit-flow.el

(autoload 'magit-flow-mode "magit/magit-flow" "\
FLOW support for Magit

\(fn &optional ARG)" t nil)

(autoload 'turn-on-magit-flow "magit/magit-flow" "\
Unconditionally turn on `magit-flow-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads (turn-on-magit-stgit magit-stgit-mode) "magit/magit-stgit"
;;;;;;  "magit/magit-stgit.el" (20883 63023 0 0))
;;; Generated autoloads from magit/magit-stgit.el

(autoload 'magit-stgit-mode "magit/magit-stgit" "\
StGit support for Magit

\(fn &optional ARG)" t nil)

(autoload 'turn-on-magit-stgit "magit/magit-stgit" "\
Unconditionally turn on `magit-stgit-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads (turn-on-magit-svn magit-svn-mode) "magit/magit-svn"
;;;;;;  "magit/magit-svn.el" (20883 63023 0 0))
;;; Generated autoloads from magit/magit-svn.el

(autoload 'magit-svn-mode "magit/magit-svn" "\
SVN support for Magit

\(fn &optional ARG)" t nil)

(autoload 'turn-on-magit-svn "magit/magit-svn" "\
Unconditionally turn on `magit-svn-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads (turn-on-magit-topgit magit-topgit-mode) "magit/magit-topgit"
;;;;;;  "magit/magit-topgit.el" (20883 63023 0 0))
;;; Generated autoloads from magit/magit-topgit.el

(autoload 'magit-topgit-mode "magit/magit-topgit" "\
Topgit support for Magit

\(fn &optional ARG)" t nil)

(autoload 'turn-on-magit-topgit "magit/magit-topgit" "\
Unconditionally turn on `magit-topgit-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads (global-magit-wip-save-mode magit-wip-save-mode
;;;;;;  magit-wip-mode) "magit/magit-wip" "magit/magit-wip.el" (20883
;;;;;;  63023 0 0))
;;; Generated autoloads from magit/magit-wip.el

(defvar magit-wip-mode nil "\
Non-nil if Magit-Wip mode is enabled.
See the command `magit-wip-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `magit-wip-mode'.")

(custom-autoload 'magit-wip-mode "magit/magit-wip" nil)

(autoload 'magit-wip-mode "magit/magit-wip" "\
In Magit log buffers; give wip refs a special appearance.

\(fn &optional ARG)" t nil)

(autoload 'magit-wip-save-mode "magit/magit-wip" "\
Magit support for committing to a work-in-progress ref.

When this minor mode is turned on and a file is saved inside a
writable git repository then it is also committed to a special
work-in-progress ref.

\(fn &optional ARG)" t nil)

(defvar global-magit-wip-save-mode nil "\
Non-nil if Global-Magit-Wip-Save mode is enabled.
See the command `global-magit-wip-save-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-magit-wip-save-mode'.")

(custom-autoload 'global-magit-wip-save-mode "magit/magit-wip" nil)

(autoload 'global-magit-wip-save-mode "magit/magit-wip" "\
Toggle Magit-Wip-Save mode in all buffers.
With prefix ARG, enable Global-Magit-Wip-Save mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Magit-Wip-Save mode is enabled in all buffers where
`turn-on-magit-wip-save' would do it.
See `magit-wip-save-mode' for more information on Magit-Wip-Save mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (rebase-mode) "magit/rebase-mode" "magit/rebase-mode.el"
;;;;;;  (20883 63023 0 0))
;;; Generated autoloads from magit/rebase-mode.el

(autoload 'rebase-mode "magit/rebase-mode" "\
Major mode for editing of a Git rebase file.

Rebase files are generated when you run 'git rebase -i' or run
`magit-interactive-rebase'.  They describe how Git should perform
the rebase.  See the documentation for git-rebase (e.g., by
running 'man git-rebase' at the command line) for details.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("git-rebase-todo" . rebase-mode))

;;;***

;;;### (autoloads (gfm-mode markdown-mode) "markdown-mode/markdown-mode"
;;;;;;  "markdown-mode/markdown-mode.el" (20883 63033 0 0))
;;; Generated autoloads from markdown-mode/markdown-mode.el

(autoload 'markdown-mode "markdown-mode/markdown-mode" "\
Major mode for editing Markdown files.

\(fn)" t nil)

(autoload 'gfm-mode "markdown-mode/markdown-mode" "\
Major mode for editing GitHub Flavored Markdown files.

\(fn)" t nil)

;;;***

;;;### (autoloads (multi-web-mode) "multi-web-mode/multi-web-mode"
;;;;;;  "multi-web-mode/multi-web-mode.el" (20883 63079 0 0))
;;; Generated autoloads from multi-web-mode/multi-web-mode.el

(autoload 'multi-web-mode "multi-web-mode/multi-web-mode" "\
Enables the multi web mode chunk detection and indentation

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (mc/edit-beginnings-of-lines mc/edit-ends-of-lines
;;;;;;  mc/edit-lines) "multiple-cursors/mc-edit-lines" "multiple-cursors/mc-edit-lines.el"
;;;;;;  (20883 63067 0 0))
;;; Generated autoloads from multiple-cursors/mc-edit-lines.el

(autoload 'mc/edit-lines "multiple-cursors/mc-edit-lines" "\
Add one cursor to each line of the active region.
Starts from mark and moves in straight down or up towards the
line point is on.

\(fn)" t nil)

(autoload 'mc/edit-ends-of-lines "multiple-cursors/mc-edit-lines" "\
Add one cursor to the end of each line in the active region.

\(fn)" t nil)

(autoload 'mc/edit-beginnings-of-lines "multiple-cursors/mc-edit-lines" "\
Add one cursor to the beginning of each line in the active region.

\(fn)" t nil)

;;;***

;;;### (autoloads (mc/mark-sgml-tag-pair mc/add-cursor-on-click mc/mark-all-symbols-like-this-in-defun
;;;;;;  mc/mark-all-words-like-this-in-defun mc/mark-all-like-this-in-defun
;;;;;;  mc/mark-all-like-this-dwim mc/mark-more-like-this-extended
;;;;;;  mc/mark-all-in-region mc/mark-all-symbols-like-this mc/mark-all-words-like-this
;;;;;;  mc/mark-all-like-this mc/unmark-previous-like-this mc/unmark-next-like-this
;;;;;;  mc/mark-previous-lines mc/mark-next-lines mc/mark-previous-symbol-like-this
;;;;;;  mc/mark-previous-word-like-this mc/mark-previous-like-this
;;;;;;  mc/mark-next-symbol-like-this mc/mark-next-word-like-this
;;;;;;  mc/mark-next-like-this) "multiple-cursors/mc-mark-more" "multiple-cursors/mc-mark-more.el"
;;;;;;  (20883 63067 0 0))
;;; Generated autoloads from multiple-cursors/mc-mark-more.el

(autoload 'mc/mark-next-like-this "multiple-cursors/mc-mark-more" "\
Find and mark the next part of the buffer matching the currently active region
With negative ARG, delete the last one instead.
With zero ARG, skip the last one and mark next.

\(fn ARG)" t nil)

(autoload 'mc/mark-next-word-like-this "multiple-cursors/mc-mark-more" "\


\(fn ARG)" t nil)

(autoload 'mc/mark-next-symbol-like-this "multiple-cursors/mc-mark-more" "\


\(fn ARG)" t nil)

(autoload 'mc/mark-previous-like-this "multiple-cursors/mc-mark-more" "\
Find and mark the previous part of the buffer matching the currently active region
With negative ARG, delete the last one instead.
With zero ARG, skip the last one and mark next.

\(fn ARG)" t nil)

(autoload 'mc/mark-previous-word-like-this "multiple-cursors/mc-mark-more" "\


\(fn ARG)" t nil)

(autoload 'mc/mark-previous-symbol-like-this "multiple-cursors/mc-mark-more" "\


\(fn ARG)" t nil)

(autoload 'mc/mark-next-lines "multiple-cursors/mc-mark-more" "\


\(fn ARG)" t nil)

(autoload 'mc/mark-previous-lines "multiple-cursors/mc-mark-more" "\


\(fn ARG)" t nil)

(autoload 'mc/unmark-next-like-this "multiple-cursors/mc-mark-more" "\
Deselect next part of the buffer matching the currently active region.

\(fn ARG)" t nil)

(autoload 'mc/unmark-previous-like-this "multiple-cursors/mc-mark-more" "\
Deselect prev part of the buffer matching the currently active region.

\(fn ARG)" t nil)

(autoload 'mc/mark-all-like-this "multiple-cursors/mc-mark-more" "\
Find and mark all the parts of the buffer matching the currently active region

\(fn)" t nil)

(autoload 'mc/mark-all-words-like-this "multiple-cursors/mc-mark-more" "\


\(fn)" t nil)

(autoload 'mc/mark-all-symbols-like-this "multiple-cursors/mc-mark-more" "\


\(fn)" t nil)

(autoload 'mc/mark-all-in-region "multiple-cursors/mc-mark-more" "\
Find and mark all the parts in the region matching the given search

\(fn BEG END)" t nil)

(autoload 'mc/mark-more-like-this-extended "multiple-cursors/mc-mark-more" "\
Like mark-more-like-this, but then lets you adjust with arrows key.
The actual adjustment made depends on the final component of the
key-binding used to invoke the command, with all modifiers removed:

   <up>    Mark previous like this
   <down>  Mark next like this
   <left>  If last was previous, skip it
           If last was next, remove it
   <right> If last was next, skip it
           If last was previous, remove it

Then, continue to read input events and further add or move marks
as long as the input event read (with all modifiers removed)
is one of the above.

\(fn)" t nil)

(autoload 'mc/mark-all-like-this-dwim "multiple-cursors/mc-mark-more" "\
Tries to guess what you want to mark all of.
Can be pressed multiple times to increase selection.

With prefix, it behaves the same as original `mc/mark-all-like-this'

\(fn ARG)" t nil)

(autoload 'mc/mark-all-like-this-in-defun "multiple-cursors/mc-mark-more" "\
Mark all like this in defun.

\(fn)" t nil)

(autoload 'mc/mark-all-words-like-this-in-defun "multiple-cursors/mc-mark-more" "\
Mark all words like this in defun.

\(fn)" t nil)

(autoload 'mc/mark-all-symbols-like-this-in-defun "multiple-cursors/mc-mark-more" "\
Mark all symbols like this in defun.

\(fn)" t nil)

(autoload 'mc/add-cursor-on-click "multiple-cursors/mc-mark-more" "\
Add a cursor where you click.

\(fn EVENT)" t nil)

(autoload 'mc/mark-sgml-tag-pair "multiple-cursors/mc-mark-more" "\
Mark the tag we're in and its pair for renaming.

\(fn)" t nil)

;;;***

;;;### (autoloads (mc/sort-regions mc/reverse-regions mc/insert-numbers)
;;;;;;  "multiple-cursors/mc-separate-operations" "multiple-cursors/mc-separate-operations.el"
;;;;;;  (20883 63067 0 0))
;;; Generated autoloads from multiple-cursors/mc-separate-operations.el

(autoload 'mc/insert-numbers "multiple-cursors/mc-separate-operations" "\
Insert increasing numbers for each cursor, starting at 0 or ARG.

\(fn ARG)" t nil)

(autoload 'mc/reverse-regions "multiple-cursors/mc-separate-operations" "\


\(fn)" t nil)

(autoload 'mc/sort-regions "multiple-cursors/mc-separate-operations" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (set-rectangular-region-anchor) "multiple-cursors/rectangular-region-mode"
;;;;;;  "multiple-cursors/rectangular-region-mode.el" (20883 63067
;;;;;;  0 0))
;;; Generated autoloads from multiple-cursors/rectangular-region-mode.el

(autoload 'set-rectangular-region-anchor "multiple-cursors/rectangular-region-mode" "\
Anchors the rectangular region at point.

Think of this one as `set-mark' except you're marking a rectangular region. It is
an exceedingly quick way of adding multiple cursors to multiple lines.

\(fn)" t nil)

;;;***

;;;### (autoloads (nrepl nrepl-jack-in nrepl-disable-on-existing-clojure-buffers
;;;;;;  nrepl-enable-on-existing-clojure-buffers nrepl-interaction-mode)
;;;;;;  "nrepl/nrepl" "nrepl/nrepl.el" (20883 62836 0 0))
;;; Generated autoloads from nrepl/nrepl.el

(autoload 'nrepl-interaction-mode "nrepl/nrepl" "\
Minor mode for nrepl interaction from a Clojure buffer.

\\{nrepl-interaction-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'nrepl-enable-on-existing-clojure-buffers "nrepl/nrepl" "\
Enable interaction mode on existing Clojure buffers.
See command `nrepl-interaction-mode'.

\(fn)" t nil)

(autoload 'nrepl-disable-on-existing-clojure-buffers "nrepl/nrepl" "\
Disable interaction mode on existing Clojure buffers.
See command `nrepl-interaction-mode'.

\(fn)" t nil)

(autoload 'nrepl-jack-in "nrepl/nrepl" "\
Start a nREPL server for the current project and connect to it.
If PROMPT-PROJECT is t, then prompt for the project for which to
start the server.

\(fn &optional PROMPT-PROJECT)" t nil)

(add-hook 'nrepl-connected-hook 'nrepl-enable-on-existing-clojure-buffers)

(autoload 'nrepl "nrepl/nrepl" "\
Connect nrepl to HOST and PORT.

\(fn HOST PORT)" t nil)

(eval-after-load 'clojure-mode '(progn (define-key clojure-mode-map (kbd "C-c M-j") 'nrepl-jack-in) (define-key clojure-mode-map (kbd "C-c M-c") 'nrepl)))

;;;***

;;;### (autoloads (paredit-mode) "paredit/paredit" "paredit/paredit.el"
;;;;;;  (20883 63111 0 0))
;;; Generated autoloads from paredit/paredit.el

(autoload 'paredit-mode "paredit/paredit" "\
Minor mode for pseudo-structurally editing Lisp code.
With a prefix argument, enable Paredit Mode even if there are
  unbalanced parentheses in the buffer.
Paredit behaves badly if parentheses are unbalanced, so exercise
  caution when forcing Paredit Mode to be enabled, and consider
  fixing unbalanced parentheses instead.
\\<paredit-mode-map>

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (php-mode php-file-patterns php-mode-to-use) "php-mode-improved/php-mode-improved"
;;;;;;  "php-mode-improved/php-mode-improved.el" (20883 63114 0 0))
;;; Generated autoloads from php-mode-improved/php-mode-improved.el

(defvar php-mode-to-use (progn (require 'mumamo nil t) (if (fboundp 'nxhtml-mumamo-turn-on) 'nxhtml-mumamo-turn-on (if (fboundp 'html-mumamo-turn-on) 'html-mumamo-turn-on 'php-mode))) "\
Major mode turn on function to use for php files.")

(custom-autoload 'php-mode-to-use "php-mode-improved/php-mode-improved" t)

(defvar php-file-patterns '("\\.php[s34]?\\'" "\\.phtml\\'" "\\.inc\\'") "\
List of file patterns for which to automatically invoke `php-mode'.")

(custom-autoload 'php-file-patterns "php-mode-improved/php-mode-improved" nil)

(autoload 'php-mode "php-mode-improved/php-mode-improved" "\
Major mode for editing PHP code.

\\{php-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (python-django-open-project) "python-django/python-django"
;;;;;;  "python-django/python-django.el" (20883 63122 0 0))
;;; Generated autoloads from python-django/python-django.el

(autoload 'python-django-open-project "python-django/python-django" "\
Open a Django project at given DIRECTORY using SETTINGS.
Optional argument EXISTING is internal and should not be used.

The recommended way to chose your project root, is to use the
directory containing your settings module; for instance if your
settings module is in /path/django/settings.py, use /path/django/
as your project path and django.settings as your settings module.

When called with no `prefix-arg', this function will try to find
an opened project-buffer, if current buffer is already a project
buffer it will cycle to next opened project.  If no project
buffers are found, then the user prompted for the project path
and settings module unless `python-django-project-root' and
`python-django-project-settings' are somehow set, normally via
directory local variables.  If none of the above matched or the
function is called with one `prefix-arg' and there are projects
defined in the `python-django-known-projects' variable the user
is prompted for any of those known projects, if the variable
turns to be nil the user will be prompted for project-path and
settings module (the same happens when called with two or more
`prefix-arg').

\(fn DIRECTORY SETTINGS &optional EXISTING)" t nil)

;;;***

;;;### (autoloads (python-mode run-python) "python/python" "python/python.el"
;;;;;;  (20883 63119 0 0))
;;; Generated autoloads from python/python.el

(add-to-list 'auto-mode-alist (cons (purecopy "\\.py\\'") 'python-mode))

(add-to-list 'interpreter-mode-alist (cons (purecopy "python") 'python-mode))

(autoload 'run-python "python/python" "\
Run an inferior Python process.
Input and output via buffer named after
`python-shell-buffer-name'.  If there is a process already
running in that buffer, just switch to it.

With argument, allows you to define CMD so you can edit the
command used to call the interpreter and define DEDICATED, so a
dedicated process for the current buffer is open.  When numeric
prefix arg is other than 0 or 4 do not SHOW.

Runs the hook `inferior-python-mode-hook' (after the
`comint-mode-hook' is run).  (Type \\[describe-mode] in the
process buffer for a list of commands.)

\(fn CMD &optional DEDICATED SHOW)" t nil)

(autoload 'python-mode "python/python" "\
Major mode for editing Python files.

\\{python-mode-map}
Entry to this mode calls the value of `python-mode-hook'
if that value is non-nil.

\(fn)" t nil)

;;;***

;;;### (autoloads (rainbow-mode) "rainbow-mode/rainbow-mode" "rainbow-mode/rainbow-mode.el"
;;;;;;  (20883 63129 0 0))
;;; Generated autoloads from rainbow-mode/rainbow-mode.el

(autoload 'rainbow-mode "rainbow-mode/rainbow-mode" "\
Colorize strings that represent colors.
This will fontify with colors the string like \"#aabbcc\" or \"blue\".

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (scss-mode) "scss-mode/scss-mode" "scss-mode/scss-mode.el"
;;;;;;  (20883 63133 0 0))
;;; Generated autoloads from scss-mode/scss-mode.el

(autoload 'scss-mode "scss-mode/scss-mode" "\
Major mode for editing SCSS files, http://sass-lang.com/
Special commands:
\\{scss-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;;;***

;;;### (autoloads (smart-tab-mode smart-tab-mode-on smart-tab) "smart-tab/smart-tab"
;;;;;;  "smart-tab/smart-tab.el" (20883 63142 0 0))
;;; Generated autoloads from smart-tab/smart-tab.el

(autoload 'smart-tab "smart-tab/smart-tab" "\
Try to 'do the smart thing' when tab is pressed.
`smart-tab' attempts to expand the text before the point or
indent the current line or selection.

In a regular buffer, `smart-tab' will attempt to expand with
either `hippie-expand' or `dabbrev-expand', depending on the
value of `smart-tab-using-hippie-expand'. Alternatively, if
`auto-complete-mode' is enabled in the current buffer,
`auto-complete' will be used to attempt expansion. If the mark is
active, or PREFIX is \\[universal-argument], then `smart-tab'
will indent the region or the current line (if the mark is not
active).

\(fn &optional PREFIX)" t nil)

(autoload 'smart-tab-mode-on "smart-tab/smart-tab" "\
Turn on `smart-tab-mode'.

\(fn)" nil nil)

(autoload 'smart-tab-mode "smart-tab/smart-tab" "\
Enable `smart-tab' to be used in place of tab.

With no argument, this command toggles the mode.
Non-null prefix argument turns on the mode.
Null prefix argument turns off the mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (smex-initialize smex) "smex/smex" "smex/smex.el"
;;;;;;  (20883 63140 0 0))
;;; Generated autoloads from smex/smex.el

(autoload 'smex "smex/smex" "\


\(fn)" t nil)

(autoload 'smex-initialize "smex/smex" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (tabulated-list-mode) "tabulated-list/tabulated-list"
;;;;;;  "tabulated-list/tabulated-list.el" (20883 62959 0 0))
;;; Generated autoloads from tabulated-list/tabulated-list.el

(autoload 'tabulated-list-mode "tabulated-list/tabulated-list" "\
Generic major mode for browsing a list of items.
This mode is usually not used directly; instead, other major
modes are derived from it, using `define-derived-mode'.

In this major mode, the buffer is divided into multiple columns,
which are labelled using the header line.  Each non-empty line
belongs to one \"entry\", and the entries can be sorted according
to their column values.

An inheriting mode should usually do the following in their body:

 - Set `tabulated-list-format', specifying the column format.
 - Set `tabulated-list-revert-hook', if the buffer contents need
   to be specially recomputed prior to `revert-buffer'.
 - Maybe set a `tabulated-list-entries' function (see below).
 - Maybe set `tabulated-list-printer' (see below).
 - Maybe set `tabulated-list-padding'.
 - Call `tabulated-list-init-header' to initialize `header-line-format'
   according to `tabulated-list-format'.

An inheriting mode is usually accompanied by a \"list-FOO\"
command (e.g. `list-packages', `list-processes').  This command
creates or switches to a buffer and enables the major mode in
that buffer.  If `tabulated-list-entries' is not a function, the
command should initialize it to a list of entries for displaying.
Finally, it should call `tabulated-list-print'.

`tabulated-list-print' calls the printer function specified by
`tabulated-list-printer', once for each entry.  The default
printer is `tabulated-list-print-entry', but a mode that keeps
data in an ewoc may instead specify a printer function (e.g., one
that calls `ewoc-enter-last'), with `tabulated-list-print-entry'
as the ewoc pretty-printer.

\(fn)" t nil)

;;;***

;;;### (autoloads (global-undo-tree-mode undo-tree-mode) "undo-tree/undo-tree"
;;;;;;  "undo-tree/undo-tree.el" (20883 63137 0 0))
;;; Generated autoloads from undo-tree/undo-tree.el

(autoload 'undo-tree-mode "undo-tree/undo-tree" "\
Toggle undo-tree mode.
With no argument, this command toggles the mode.
A positive prefix argument turns the mode on.
A negative prefix argument turns it off.

Undo-tree-mode replaces Emacs' standard undo feature with a more
powerful yet easier to use version, that treats the undo history
as what it is: a tree.

The following keys are available in `undo-tree-mode':

  \\{undo-tree-map}

Within the undo-tree visualizer, the following keys are available:

  \\{undo-tree-visualizer-mode-map}

\(fn &optional ARG)" t nil)

(defvar global-undo-tree-mode nil "\
Non-nil if Global-Undo-Tree mode is enabled.
See the command `global-undo-tree-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-undo-tree-mode'.")

(custom-autoload 'global-undo-tree-mode "undo-tree/undo-tree" nil)

(autoload 'global-undo-tree-mode "undo-tree/undo-tree" "\
Toggle Undo-Tree mode in all buffers.
With prefix ARG, enable Global-Undo-Tree mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Undo-Tree mode is enabled in all buffers where
`turn-on-undo-tree-mode' would do it.
See `undo-tree-mode' for more information on Undo-Tree mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (yaml-mode yaml) "yaml-mode/yaml-mode" "yaml-mode/yaml-mode.el"
;;;;;;  (20883 63144 0 0))
;;; Generated autoloads from yaml-mode/yaml-mode.el

(let ((loads (get 'yaml 'custom-loads))) (if (member '"yaml-mode/yaml-mode" loads) nil (put 'yaml 'custom-loads (cons '"yaml-mode/yaml-mode" loads))))

(autoload 'yaml-mode "yaml-mode/yaml-mode" "\
Simple mode to edit YAML.

\\{yaml-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))

;;;***

;;;### (autoloads (yas-global-mode yas-minor-mode) "yasnippet/yasnippet"
;;;;;;  "yasnippet/yasnippet.el" (20883 63171 0 0))
;;; Generated autoloads from yasnippet/yasnippet.el

(autoload 'yas-minor-mode "yasnippet/yasnippet" "\
Toggle YASnippet mode.

When YASnippet mode is enabled, `yas-expand', normally bound to
the TAB key, expands snippets of code depending on the major
mode.

With no argument, this command toggles the mode.
positive prefix argument turns on the mode.
Negative prefix argument turns off the mode.

Key bindings:
\\{yas-minor-mode-map}

\(fn &optional ARG)" t nil)

(defvar yas-global-mode nil "\
Non-nil if Yas-Global mode is enabled.
See the command `yas-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `yas-global-mode'.")

(custom-autoload 'yas-global-mode "yasnippet/yasnippet" nil)

(autoload 'yas-global-mode "yasnippet/yasnippet" "\
Toggle Yas minor mode in all buffers.
With prefix ARG, enable Yas-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Yas minor mode is enabled in all buffers where
`yas-minor-mode-on' would do it.
See `yas-minor-mode' for more information on Yas minor mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (zencoding-preview zencoding-expand-yas zencoding-mode
;;;;;;  zencoding-expand-line) "zencoding-mode/zencoding-mode" "zencoding-mode/zencoding-mode.el"
;;;;;;  (20883 63174 0 0))
;;; Generated autoloads from zencoding-mode/zencoding-mode.el

(autoload 'zencoding-expand-line "zencoding-mode/zencoding-mode" "\
Replace the current line's zencode expression with the corresponding expansion.
If prefix ARG is given or region is visible call `zencoding-preview' to start an
interactive preview.

Otherwise expand line directly.

For more information see `zencoding-mode'.

\(fn ARG)" t nil)

(autoload 'zencoding-mode "zencoding-mode/zencoding-mode" "\
Minor mode for writing HTML and CSS markup.
With zen coding for HTML and CSS you can write a line like

  ul#name>li.item*2

and have it expanded to

  <ul id=\"name\">
    <li class=\"item\"></li>
    <li class=\"item\"></li>
  </ul>

This minor mode defines keys for quick access:

\\{zencoding-mode-keymap}

Home page URL `http://www.emacswiki.org/emacs/ZenCoding'.

See also `zencoding-expand-line'.

\(fn &optional ARG)" t nil)

(autoload 'zencoding-expand-yas "zencoding-mode/zencoding-mode" "\


\(fn)" t nil)

(autoload 'zencoding-preview "zencoding-mode/zencoding-mode" "\
Expand zencode between BEG and END interactively.
This will show a preview of the expanded zen code and you can
accept it or skip it.

\(fn BEG END)" t nil)

;;;***

;;;### (autoloads nil nil ("async/async-file.el" "async/async-pkg.el"
;;;;;;  "async/async-test.el" "async/dired-async.el" "async/helm-async.el"
;;;;;;  "async/smtpmail-async.el" "auto-complete/auto-complete-config.el"
;;;;;;  "auto-complete/auto-complete-pkg.el" "base16-themes/base16-chalk-theme.el"
;;;;;;  "base16-themes/base16-default-theme.el" "base16-themes/base16-eighties-theme.el"
;;;;;;  "base16-themes/base16-greenscreen-theme.el" "base16-themes/base16-mocha-theme.el"
;;;;;;  "base16-themes/base16-monokai-theme.el" "base16-themes/base16-ocean-theme.el"
;;;;;;  "base16-themes/base16-railscasts-theme.el" "base16-themes/base16-solarized-theme.el"
;;;;;;  "base16-themes/base16-theme-autoloads.el" "base16-themes/base16-tomorrow-theme.el"
;;;;;;  "ctable/ctable.el" "ctable/test-ctable.el" "deferred/concurrent-sample.el"
;;;;;;  "deferred/concurrent.el" "deferred/deferred-samples.el" "deferred/deferred.el"
;;;;;;  "deferred/test-concurrent.el" "deferred/test-deferred.el"
;;;;;;  "dired-details/dired-details.el" "el-get/el-get-autoloads.el"
;;;;;;  "el-get/el-get-build.el" "el-get/el-get-byte-compile.el"
;;;;;;  "el-get/el-get-core.el" "el-get/el-get-custom.el" "el-get/el-get-dependencies.el"
;;;;;;  "el-get/el-get-install.el" "el-get/el-get-methods.el" "el-get/el-get-notify.el"
;;;;;;  "el-get/el-get-recipes.el" "el-get/el-get-status.el" "epc/epc.el"
;;;;;;  "epc/epcs.el" "epc/test-epc.el" "expand-region/cc-mode-expansions.el"
;;;;;;  "expand-region/clojure-mode-expansions.el" "expand-region/cperl-mode-expansions.el"
;;;;;;  "expand-region/css-mode-expansions.el" "expand-region/er-basic-expansions.el"
;;;;;;  "expand-region/erlang-mode-expansions.el" "expand-region/expand-region-core.el"
;;;;;;  "expand-region/expand-region-pkg.el" "expand-region/feature-mode-expansions.el"
;;;;;;  "expand-region/html-mode-expansions.el" "expand-region/js-mode-expansions.el"
;;;;;;  "expand-region/js2-mode-expansions.el" "expand-region/jsp-expansions.el"
;;;;;;  "expand-region/latex-mode-expansions.el" "expand-region/nxml-mode-expansions.el"
;;;;;;  "expand-region/octave-expansions.el" "expand-region/org-mode-expansions.el"
;;;;;;  "expand-region/python-el-expansions.el" "expand-region/python-el-fgallina-expansions.el"
;;;;;;  "expand-region/python-mode-expansions.el" "expand-region/ruby-mode-expansions.el"
;;;;;;  "expand-region/sml-mode-expansions.el" "expand-region/text-mode-expansions.el"
;;;;;;  "expand-region/web-mode-expansions.el" "fuzzy/fuzzy.el" "gh/gh-pkg.el"
;;;;;;  "gh/gh-profile.el" "gh/gh.el" "jedi/test-jedi.el" "jedi/tryout-jedi.el"
;;;;;;  "jquery-doc/jquery-doc-data.el" "jquery-doc/jquery-doc-test.el"
;;;;;;  "logito/logito.el" "magit/50magit.el" "magit/magit-bisect.el"
;;;;;;  "magit/magit-key-mode.el" "magit/magit-pkg.el" "multi-web-mode/mweb-example-config.el"
;;;;;;  "multiple-cursors/mc-cycle-cursors.el" "multiple-cursors/multiple-cursors-core.el"
;;;;;;  "multiple-cursors/multiple-cursors-pkg.el" "multiple-cursors/multiple-cursors.el"
;;;;;;  "pcache/pcache-tests.el" "pcache/pcache.el" "popup/popup.el"
;;;;;;  "rainbow-mode/rainbow-mode-autoloads.el" "rainbow-mode/rainbow-mode-pkg.el"
;;;;;;  "region-bindings-mode/region-bindings-mode.el" "startupd/startupd.el"
;;;;;;  "yasnippet/yasnippet-debug.el" "yasnippet/yasnippet-tests.el")
;;;;;;  (20883 63559 799152 843000))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here

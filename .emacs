
(defun my-add-subdirs-to-load-path (dir)
(let ((default-directory (concat dir "/")))
(setq load-path (cons dir load-path))
(normal-top-level-add-subdirs-to-load-path)))

(my-add-subdirs-to-load-path "~/.emacs.d")

;;set for codeing system
;; 设置默认编码
;;set utf8 code
(set-language-environment "UTF-8")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(setq default-major-mode 'text-mode)


;;set of setting utf8

;;(set-language-environment "Chinese-GB18030")
;;(setq file-name-coding-system 'gb18030)

;;设置主题
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
(color-theme-robin-hood)
 
;;end of 主题
;;end set font
(autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
    (autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
    (autoload 'mercury-mode "prolog" "Major mode for editing Mercury programs." t)
    (setq prolog-system 'swi)
    (setq auto-mode-alist (append '(("\\.pro$" . prolog-mode)
                                   ("\\.m$" . mercury-mode))
                                   auto-mode-alist))

;;回复桌面
;;############### Session.el ###############
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
;;############### Desktop Reload ###############
;;(load "desktop")
(require 'desktop)
;;(add-to-list 'desktop-modes-not-to-save 'dired-mode)
;;(add-to-list 'desktop-modes-not-to-save 'Info-mode)
;;(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
;;(add-to-list 'desktop-modes-not-to-save 'fundamental-mode)
;; use only one desktop
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")
(desktop-load-default) 
(desktop-read)
(setq desktop-base-file-name "emacs-desktop")
(desktop-save-mode t)

;;多标签支持
(require 'tabbar) 
(setq tabbar-speedkey-use t)
(setq tabbar-speedkey-prefix (kbd "<f1>"))
(tabbar-mode 1)


;;配置perl
;(require 'cperl-mode)
;;(add-hook 'perl-mode-hook 'cperl-mode)

;;配置org-mode
;;(setq org-hide-leading-stars t) 
 (define-key global-map "\C-ca" 'org-agenda) 
 (setq org-log-done 'time)  

;;插入今天时间
(defun insert-time ()
(interactive)
(insert (format-time-string "%Y-%m-%d-%R")))

;;c-x c-m 调出输入命令框
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
;;(global-set-key "\C-x\C-k" 'kill-region) 
;;(global-set-key "\C-i" 'lisp-complete-symbol)
(setq outline-minor-mode-prefix [(control o)]) ;;更改outline-minor-mode的命令前缀


;; 高亮结尾白空格 
;; 设置颜色 
 ;;  (custom-set-faces
 ;;  ;; custom-set-faces was added by Custom.
 ;;  ;; If you edit it by hand, you could mess it up, so be careful.
 ;;  ;; Your init file should contain only one such instance.
 ;;  ;; If there is more than one, they won't work right.
 ;; '(default ((t (:inherit nil :stipple nil :background "#304020" :foreground "navajo white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 ;; '(my-long-line-face ((((class color)) (:background "gray10"))) t)
 ;; '(my-tab-face ((((class color)) (:background "grey10"))) t)
 ;; '(my-trailing-space-face ((((class color)) (:background "gray10"))) t))
 
;; 辅助函数，用来给指定模式添加超过80列的高亮功能 

;; (defun cc-mode-add-keywords (mode) 
;;   (font-lock-add-keywords  
;;    mode 
;;    '(("\t+" (0 'my-tab-face append)) 
;;      ("^.\\{81\\}\\(.+\\)$" (1 'my-long-line-face append))))) 
;; ;; 对指定模式使用"超过80列高亮"功能 
;; (cc-mode-add-keywords 'c-mode) 
;; (cc-mode-add-keywords 'cc-mode) 
;; (cc-mode-add-keywords 'c++-mode) 
;; (cc-mode-add-keywords 'perl-mode) 
;; (cc-mode-add-keywords 'python-mode);;高亮设置结束

;;TODO  alt键目前不会表示
;;(define-prefix-command 'alt-map)
;;(global-set-key (kbd [Alt]) 'alt-map)

;;按ctrl + 键能增加emacs字体的大小
(global-set-key (kbd "C-+") 'text-scale-increase)
;(global-set-key (kbd "C--") 'text-scale-decrease)
;(global-set-key [C-wheel-up] 'text-scale-increase)
;(global-set-key [C-wheel-down] 'text-scale-decrease)

;;这段代码能够改变shell-mode中字体的大小
;; make a face
;;(make-face 'font-lock-small-face)
;;(set-face-attribute 'font-lock-small-face nil :height 1.5) ; have smaller font. 
;; add this setting to all shell-mode buffers
;;(add-hook 'shell-mode-hook       
;;	  '(lambda ()         
;;	     (font-lock-mode t)       
;;	     (buffer-face-mode t) ; only in emacs 23         
;;	     (buffer-face-set 'font-lock-small-face)          ;; other stuff    
;;	     ))
;;end of set face


;;(set-face-foreground 'modeline "red") ;;

;;将状态栏中的字体设为红色

;;自定义math-lang-mode
;;(setq myKeywords 
;; '(("Sin\\|Cos\\|Sum" . font-lock-function-name-face)
;;   ("Pi\\|Infinity" . font-lock-constant-face)
;;  )
;;)
;;
;;(define-derived-mode math-lang-mode fundamental-mode
;;  (setq font-lock-defaults '(myKeywords))
;;  (setq mode-name "math lang")
;;)
;;math-lang-mode 结束

;;连接列表
;;(setq xlist '(1 2))
;;(setq ylist '(3 4))
;;(setq xylist `(,@xlist ,@ylist))



;;run-current-file 函数能根据buffer中的文件后缀名选择程序运行它
(defun run-current-file () 
  "Execute or compile the current file.
For example, if the current buffer is the file x.pl,
then it'll call “perl x.pl” in a shell.
The file can be php, perl, python, ruby, javascript, bash, ocaml, java.
File suffix is used to determine what program to run."
  (interactive)
  (let (extention-alist fname suffix progName cmdStr)
    (setq extention-alist ; a keyed list of file suffix to comand-line program to run
          '(
            ("php" . "php")
            ("pl" . "perl")
            ("py" . "python")
            ("rb" . "ruby")
            ("js" . "js")
            ("sh" . "bash")
            ("ml" . "ocaml")
            ("vbs" . "cscript")
            ("java" . "javac")
	    ("c"    .  "gcc")
            )
          )
    (setq fname (buffer-file-name))
    (setq suffix (file-name-extension fname))
    (setq progName (cdr (assoc suffix extention-alist)));;(assoc suffix ..)=> ("php" . "php")
    (setq cmdStr (concat progName " \""   fname "\""))
    (save-buffer fname)
    (if (string-equal suffix "el")
        (load-file fname)      (if progName                    ; is not nil
          (progn
            (message "Running...")
            (shell-command cmdStr))
        (message "No recognized program file suffix for this file.")
        ) )))
;;(global-set-key (kbd "<f5>") 'run-current-file) ;;将f5设为运行热键
;;end of run-current-file

;;set flyspell-mode program as aspell
(setq ispell-program-name "aspell")
(setq-default ispell-local-dictionary "american")
(global-set-key (kbd "") 'ispell-complete-word) 
;;end of set flyspell-mode


;;add mingw to path
;;(setenv "PATH" (concat  (getenv "PATH") ";D:\\gnu\\mingw\\msys\\2.0\\bin\\");;没有设置成功，？
;;(setq exec-path (append exec-path '("D:/gnu/mingw/msys/2.0/bin")))
;;end of adding to path

;;set where msys was install

;;关闭错误提示声
(setq visible-bell t)

(setq mouse-yank-at-point t)
;;打开递归编辑
(setq enable-recursive-minibuffers t)

;;当鼠标靠近前三行时，就开始滚动
(setq scroll-margin 3
      scroll-conservatively 10000)
;;括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;;鼠标不要挡住光标
;;(mouse-avoidance-mode 'animate)
;;打开图像模式
;;(auto-image-file-mode)
;;进行语法高亮
(global-font-lock-mode 1)
;;设置dired可以递归copy and delete files
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

;;鼠标滚轮平滑滚动
(defun smooth-scroll (increment)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.06)
  (scroll-up increment))

(global-set-key [(mouse-5)] '(lambda () (interactive) (smooth-scroll 1)))
(global-set-key [(mouse-4)] '(lambda () (interactive) (smooth-scroll -1)))
;;end of 滚轮
;;将del键设为kill-region
(global-set-key [delete] 'kill-region)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ecb-tip-of-the-day nil)
 '(mouse-1-click-in-non-selected-windows t)
 '(mouse-drag-copy-region nil)
 '(show-paren-mode t))

;;;;; ------ Octave-mode ---------------------------------------------
    ;; a tip from Jason Mobarak, http://cs.unm.edu/~jmob/windows-octave.txt
    ;; I don't know the reason
       (setenv "DISPLAY" "127.0.0.1:0.0")    ;; autolad octave mode for *.m-files
       (autoload 'octave-mode "octave-mod" nil t)
       (setq auto-mode-alist
       (cons '("\\.m$" . octave-mode) auto-mode-alist))    ;; to turn on the abbrevs, auto-fill and font-lock features automatically  
       (add-hook 'octave-mode-hook
         (lambda ()
         (abbrev-mode 1)
         (auto-fill-mode 1)
         (if (eq window-system 'x)
          (font-lock-mode 1))))    ;; And finally, inferior-octave-mode-hook is run after starting the process      
    ;; and putting its buffer into Inferior Octave mode. Hence, if you like 
    ;; the up and down arrow keys to behave in the interaction buffer as in 
    ;; the shell, and you want this buffer to use nice colors:
    
       (add-hook 'inferior-octave-mode-hook
         (lambda ()
           (turn-on-font-lock)
           (define-key inferior-octave-mode-map [up]
             'comint-previous-input)
           (define-key inferior-octave-mode-map [down]
             'comint-next-input)))     ;; RET adds a newline and indents it 
;;(add-hook 'inferior-octave-mode-hook
;;	  '(lambda ()
;;	     (setq inferior-octave-program
;;		   "octave")))
       (add-hook 'octave-mode-hook 
         '(lambda nil
           (define-key octave-mode-map "\C-m"
              'octave-reindent-then-newline-and-indent)
           (define-key octave-mode-map [(control space)]
              'octave-complete-symbol) ;; I prefere C-SPC
           (define-key octave-mode-map [(meta control tab)] 
              'octave-complete-symbol)))    ;; run an inferior Octave process in a special Emacs buffer
       (autoload 'run-octave "octave-inf" nil t)    ;; if you have the win32 version of octave
       
   ;; If `gnuserv' is installed, add the lines
    ;;   (autoload 'octave-help "octave-hlp" nil t)
      (require 'gnuserv)
       (gnuserv-start)   

;;配置haskell-mode
(load "haskell-site-file")
;;(setq haskell-program-name "D:\\gnu\\ghc-6.12.2\\bin\\ghci.exe")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;;end of setting haskell-mode



;;设置mew
;;(setq load-path (cons "/usr/local/share/emacs/site-lisp/mew" load-path))
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)
;;(setq mew-icon-directory "/usr/local/share/emacs/site-lisp/mew/etc")
(setq mew-use-cached-passwd t)
(if (boundp 'read-mail-command)
    (setq read-mail-command 'mew))
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
       'mew-user-agent
       'mew-user-agent-compose
       'mew-draft-send-message
       'mew-draft-kill
       'mew-send-hook))
(setq mew-pop-size 0)
(setq mew-smtp-auth-list nil)
(setq toolbar-mail-reader 'Mew)
(set-default 'mew-decode-quoted 't)  
(when (boundp 'utf-translate-cjk)
      (setq utf-translate-cjk t)
      (custom-set-variables
         '(utf-translate-cjk t)))
(if (fboundp 'utf-translate-cjk-mode)
    (utf-translate-cjk-mode 1)) 

;(setq w3-configuration-directory "D:\\gnu\\Emacs23.2\\site-lisp\\w3-4.0pre.47\\")
;(setq load-path (cons "e:/emacs/site-listp/w3-4.0pre.47/lisp" load-path))
;(require 'w3)

;;将cygwin设为默认的shell
;;(require 'cygwin-mount)
;;(setenv "PATH" (concat "d:/gnu/cygwin/bin;" (getenv "PATH"))) 
;;(setq exec-path (cons "d:/gnu/cygwin/bin/" exec-path)) 
;;(cygwin-mount-activate)

;; (add-hook 'comint-output-filter-functions 
;;    'shell-strip-ctrl-m nil t) 
;; (add-hook 'comint-output-filter-functions 
;;    'comint-watch-for-password-prompt nil t)

;;(setq explicit-shell-file-name "bash.exe") 
;; For subprocesses invoked via the shell 
;; (e.g., "shell -c command") 
;;(setq shell-file-name explicit-shell-file-name)
 
;;end of cygwin


;;w3m
(require 'w3m-load)
;;(require 'w3m-load)
(setq w3m-use-favicon nil)
(setq w3m-command-arguments '("-cookie" "-F"))
(setq w3m-use-cookies t)
(setq w3m-home-page "http://www.google.com")

(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(global-set-key "\C-xm" 'browse-url-at-point)


;;配置slime
;;(add-to-list 'load-path "~/hacking/lisp/slime/")  ; your SLIME directory
;;(setq inferior-lisp-program "sbcl --noinform") ; your Lisp system
(setq inferior-lisp-program "clisp")
(require 'slime)
(slime-setup)

;;end of slime


;; 实现shell中的clear命令
(add-hook 'shell-mode-hook 'n-shell-mode-hook)
(defun n-shell-mode-hook ()
  "12Jan2002 - sailor, shell mode customizations."
  (local-set-key '[up] 'comint-previous-input)
  (local-set-key '[down] 'comint-next-input)
  (local-set-key '[(shift tab)] 'comint-next-matching-input-from-input)
  (setq comint-input-sender 'n-shell-simple-send)
  )

(defun n-shell-simple-send (proc command)
  "17Jan02 - sailor. Various commands pre-processing before sending to shell."
  (cond
   ;; Checking for clear command and execute it.
   ((string-match "^[ \t]*clear[ \t]*$" command)
    (comint-send-string proc "\n")
    (erase-buffer)
    )
   ;; Checking for man command and execute it.
   ((string-match "^[ \t]*man[ \t]*" command)
    (comint-send-string proc "\n")
    (setq command (replace-regexp-in-string "^[ \t]*man[ \t]*" "" command))
    (setq command (replace-regexp-in-string "[ \t]+$" "" command))
    ;;(message (format "command %s command" command))
    (funcall 'man command)
    )
   ;; Send other commands to the default handler.
   (t (comint-simple-send proc command))
   )
  )

;;end of clear

;; emacs中支持ｆｔｐ
(defun ftp (host)
  "03Mar01, sailor"
  "Run the ftp program using cygwin ftp."
  "Fixed the problem that the login prompt cannot be seen."
  (interactive "sFtp to Host :" )
  (let ((bufname)
        (bufobject))
    (setq bufname (concat "*ftp-" host "*"))
    (setq bufobject (get-buffer bufname))

    (cond
     ((and bufobject (get-buffer-process bufobject))
      (pop-to-buffer bufname)
      )
     (t
      (let ((login)
            (process)
            (ftp-program "ftp.exe"))
        (setq bufobject (get-buffer-create bufname))
        (pop-to-buffer bufobject)
        (comint-mode)
        (setq login (read-from-minibuffer (format "%s - Login : " host)))
        (comint-exec bufobject bufname ftp-program nil
            (list "--prompt=ftp> " "-v" host))
        (message "Login in progress. Please wait ...")
        (send-invisible (format "%s" login))
        (setq process (get-buffer-process (current-buffer)))
        (accept-process-output process)
        )
      )
     )
    )
  )

;;end of ftp

;;run tc

;;(defun run-total-commander ()   
;;  (interactive)   
;;  (w32-shell-execute "open" "D:\\GreenSoftWare\\TotalCommander7.5\\totalcmd.exe")   
;;  )   
;;
;;(global-set-key [f12] 'run-total-commander)

;;end of set tc



;;set telnet in emacs
(require 'telnet)

(defun telnet (host)
  "Open a network login connection to host named HOST (a string).
Communication with HOST is recorded in a buffer `*PROGRAM-HOST*'
where PROGRAM is the telnet program being used.  This program
is controlled by the contents of the global variable
`telnet-host-properties', falling back on the value of the
global variable `telnet-program'. Normally input is edited
in Emacs and sent a line at a time."
  (interactive "sOpen connection to host: ")
  (let* ((comint-delimiter-argument-list '(?\  ?\t))
         (properties (cdr (assoc host telnet-host-properties)))
         (telnet-program (if properties (car properties) telnet-program))
         (name (concat telnet-program "-" (comint-arguments host 0 nil) ))
         (buffer (get-buffer (concat "*" name "*")))
         (telnet-options (if (cdr properties)
                 (cons "-l" (cdr properties))))
         process)
    (if (and buffer (get-buffer-process buffer))
        (pop-to-buffer (concat "*" name "*"))
      (pop-to-buffer
       (apply 'make-comint name telnet-program nil telnet-options))
      (setq process (get-buffer-process (current-buffer)))
      ;;(set-process-filter process 'telnet-initial-filter)
      ;; Don't send the `open' cmd till telnet is ready for it.
      ;;(accept-process-output process)
      (erase-buffer)
      (send-string process (concat "open " host "\n"))
      (telnet-mode)
      (setq telnet-remote-echoes nil)
      (setq telnet-new-line "\n") ;; needed for cygwin 1.3.11
      (setq comint-input-sender 'telnet-simple-send)
      (setq telnet-count telnet-initial-count)
      (setq comint-process-echoes t)
      )))

;;end of telnet


;解决emacs shell 乱码

(ansi-color-for-comint-mode-on)

;; answer y or n to replace yes-no
(fset 'yes-or-no-p 'y-or-n-p)

;;配置auto-complete


;;配置IDE

;; (require 'cedet) ;;加载cedet
;; (semantic-load-enable-code-helpers)
;; (setq semanticdb-default-save-directory "~/.emacs.d/")
;; (setq global-ede-mode nil)
;; (require 'semantic-gcc)
;; (require 'ecb) ;;加载ecb

;;输命令时给出可选的提示
(icomplete-mode 1)

;;显示行数
;;(linum-mode)

;;按%号使括号跳转
(global-set-key "%" 'match-paren)         
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))

;;注释区域与反注释区域

;;(comment-region)
;;(uncomment-region)


;; 将win键设置为修饰键
(when (eq system-type 'windows-nt)
  (setq w32-pass-lwindow-to-system nil
        w32-pass-rwindow-to-system nil
        w32-pass-apps-to-system nil
        w32-capslock-is-shiftlock nil
        w32-enable-caps-lock nil
        w32-lwindow-modifier 'super ;; Left Windows key
        w32-rwindow-modifier 'alt
        w32-recognize-altgr nil
        w32-apps-modifier 'hyper

        ))
(global-set-key (kbd "s-o") 'compile)
(global-set-key (kbd "s-k") 'uncomment-region)
(global-set-key (kbd "s-h") 'comment-region)

;;类似于vim中的跳转。按C-=保存当前位置，C－-跳转到上次位置。
(global-set-key [(control ?\=)] 'ska-point-to-register)
(global-set-key [(control ?\-)] 'ska-jump-to-register)
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register. Use ska-jump-to-register to jump back to the stored  position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun ska-jump-to-register()
  "Switches between current cursorposition and position that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
        (jump-to-register 8)
        (set-register 8 tmp)))


;;;;类似vim中的fx功能，当按c-c f时输入要查找的字符，按一次跳一次
(defun wy-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
		     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

(defun wy-back-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `wy-back-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil (- 0 n))
  (while (char-equal (read-char)
		     char)
    (search-forward (string char) nil nil (- 0 n)))
  (setq unread-command-events (list last-input-event)))

(define-key global-map (kbd "C-c b") 'wy-back-to-char)
(define-key global-map (kbd "C-c f") 'wy-go-to-char)

;; 启用以下功能
(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

;; 增加自定义关键字
;; (dolist (mode '(c-mode c++-mode java-mode lisp-mode emacs-lisp-mode lisp-interaction-mode sh-mode
;;                        sgml-mode))
;;   (font-lock-add-keywords mode
;;                           '(("\\<\\(FIXME\\|TODO\\|Todo\\|HACK\\):" 1 font-lock-warning-face prepend)
;;                             ("\\<\\(and\\|or\\|not\\)\\>" . font-lock-keyword-face)
;;                             ("(\\|)" . beautiful-blue-face)
;;                             ("\\[\\|]" . yellow-face)
;;                             ("<\\|>" . cyan-face)
;;                             ("{\\|}" . green-face))))



;;这个函数能根据括号来使代码对齐
(defun ywb-indent-accoding-to-paren ()
  "按块([]{}())来格式化代码"
  (interactive)
  (let ((prev-char (char-to-string (preceding-char)))
        (next-char (char-to-string (following-char)))
        (pos (point)))
    (save-excursion
      (cond ((string-match "[[{(<]" next-char)
	     (indent-region pos (progn (forward-sexp 1) (point)) nil))
            ((string-match "[\]})>]" prev-char)
             (indent-region (progn (backward-sexp 1) (point)) pos nil))))))
(global-set-key (kbd "C-M-]") 'ywb-indent-accoding-to-paren)

;; 没有提示音,也不闪屏

(setq ring-bell-function 'ignore)

(global-set-key (kbd "C-l") 'center-line)

				   
(defun xilbert-insert-previous-content ()
  (interactive)
  (if (> (length kill-ring-yank-pointer) 1)
      (insert (nth 1 kill-ring-yank-pointer))
    (message "kill-ring has no two items")))

(global-set-key (kbd "M-y") 'xilbert-insert-previous-content)

(setq x-select-enable-clipboard nil)
(put 'narrow-to-page 'disabled nil)


;;800次按键后自动保存文件
(setq auto-save-interval 800)

;;回车既对齐页换行

(global-set-key "\C-m" 'newline-and-indent)

;;set for eshell
;;(add-hook 'eshell-mode-hook
;;   '(lambda nil
;;   ;;(eshell/export "EPOCROOT=\\Paragon\\")
;;   (let ((path))
;;      (setq path ".;D:/gnu/Emacs23.2/EmacsW32/gnuwin32/bin/")
;;      ;;(setq path (concat path ";d:/program files/microsoft visual studio/vc98/bin"))
;;    (setenv "PATH" path))
;; ;;  (local-set-key "\C-u" 'eshell-kill-input))
;; ))

;;clear eshell

(defun eshell/clear ()
  "04Dec2001 - sailor, to clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;;;; CC-mode配置  http://cc-mode.sourceforge.net/
(require 'cc-mode)
;;(c-set-offset 'inline-open 0)
;;(c-set-offset 'friend '-)
;;(c-set-offset 'substatement-open 0)

;;;;我的C/C++语言编辑策略

;; (defun my-c-mode-common-hook()
;;   (setq tab-width 4 indent-tabs-mode t)
;;   ;;; hungry-delete and auto-newline
;;   (c-toggle-auto-hungry-state 1)
;;   ;;按键定义
;;   (define-key c-mode-base-map [(control \`)] 'hs-toggle-hiding)
;;   (define-key c-mode-base-map [(return)] 'newline-and-indent)
;;  ;; (define-key c-mode-base-map [(f5)] 'compile)
;;   (define-key c-mode-base-map [(meta \`)] 'c-indent-command)
;; ;;  (define-key c-mode-base-map [(tab)] 'hippie-expand)
;;   (define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
;;   (define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)
;;     ;;预处理设置
;;   (setq c-macro-shrink-window-flag t)
;;   (setq c-macro-preprocessor "cpp")
;;   (setq c-macro-cppflags " ")
;;   (setq c-macro-prompt-flag t)
;;   (setq hs-minor-mode t)
;;   (setq abbrev-mode t)
;; )

;; (add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;;;我的C++语言编辑策略
(defun my-c++-mode-hook()
  (setq tab-width 6 indent-tabs-mode nil)
  (c-set-style "stroustrup")
;;  (define-key c++-mode-map [f3] 'replace-regexp)
)

;;配置semantic的检索范围
(setq semanticdb-project-roots 
	  (list
        (expand-file-name "/")))

;;自动补齐

(defun my-indent-or-complete ()
   (interactive)
   (if (looking-at "\\>")
 	  (hippie-expand nil)
 	  (indent-for-tab-command))
 )

(global-set-key [(control tab)] 'my-indent-or-complete)

;;优先调用senator的分析结果
(autoload 'senator-try-expand-semantic "senator")

(setq hippie-expand-try-functions-list
 	  '(
		senator-try-expand-semantic
		try-expand-dabbrev
		try-expand-dabbrev-visible
		try-expand-dabbrev-all-buffers
		try-expand-dabbrev-from-kill
		try-expand-list
		try-expand-list-all-buffers
		try-expand-line
        try-expand-line-all-buffers
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-whole-kill
        )
)


(define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
(define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)

(global-set-key [(f10)] 'speedbar)

(setq auto-mode-alist (cons '("\\.cpp\\'" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.c\\'" . c-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.el\\'" . emacs-lisp-mode) auto-mode-alist))

;;end of setting c or c++ language
;;自动补全按键
;;Tab or M-/ or C-Tab

(require 'xcscope)

;;(require 'semantic)
;;(setq semantic-load-turn-everything-on t)

;;set for auctex

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook #'LaTeX-install-toolbar)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

;;maxima
;;(add-to-list 'load-path "~/site-lisp/maxima")
(add-to-list 'Info-default-directory-list "d:/Program Files/Maxima-5.21.0/info")
(autoload 'imaxima "imaxima" "Image support for Maxima." t)
(autoload 'maxima-mode "maxima" "Maxima mode" t)
(autoload 'maxima "maxima" "Maxima interaction" t)
(autoload 'imath-mode "imath" "Interactive Math minor mode" t)
(setq auto-mode-alist (cons '("\\.max" . maxima-mode) auto-mode-alist))

(setq imaxima-use-maxima-mode-flag t)
(setq maxima-use-dynamic-complete t)
(setq imaxima-fnt-size "Large")
(setq imaxima-scale-factor 1.0)
(setq imaxima-label-color "red")
(setq imaxima-equation-color "white")
(setq imaxima-max-scale 0.5)
(setq imaxima-linearize-flag t)
(setq imaxima-gs-program "gswin32c")

(defun wy-maxima-mode-hook ()
  (setq wy-starting-imaxima nil)
  (defun maxima-start ()
    "Start the Maxima process."
    (interactive)
    (if (not (processp inferior-maxima-process))
        (if (not wy-starting-imaxima)
            (let ((origbuffer (current-buffer)))            
              (setq wy-starting-imaxima t)
              (imaxima)
              (setq wy-starting-imaxima nil)
              (switch-to-buffer origbuffer))))
    (if (processp inferior-maxima-process)
        (unless (eq (process-status inferior-maxima-process) 'run)
          (delete-process inferior-maxima-process)
          (save-excursion
            (set-buffer "*maxima*")
            (erase-buffer))
          (setq inferior-maxima-process nil)))
    (unless (processp inferior-maxima-process)
      (setq maxima-input-end 0)
      (let ((mbuf)
            (cmd))
        (if maxima-args
            (setq cmd 
                  (append (list 'make-comint "maxima" maxima-command
                                nil) (split-string maxima-args))) 
          (setq cmd (list 'make-comint "maxima" maxima-command)))
        (setq mbuf (eval cmd))
        (save-excursion
          (set-buffer mbuf)
          (setq inferior-maxima-process (get-buffer-process mbuf))
          (if maxima-fix-double-prompt
              (add-to-list 'comint-output-filter-functions
                           'maxima-remove-double-prompt))
          (accept-process-output inferior-maxima-process)
          (while (not (maxima-new-prompt-p))
            (accept-process-output inferior-maxima-process))
          (inferior-maxima-mode)))
      (sit-for 0 maxima-after-output-wait))))

(add-hook 'maxima-mode-hook 'wy-maxima-mode-hook)
;;(setq maxima-command "D:/Program Files/Maxima-5.21.0/bin/maxima.bat")
(defun run-maxima ()
  (interactive)
  (pop-to-buffer "*maxima*")
  ;;(maxima-start)
  (maxima))





;;use ahei's defined face
(require 'util)
(require 'ahei-face)
(require 'color-theme-ahei)
;;(color-theme-ahei)
;; (font-lock-add-keywords 'emacs-lisp-mode
;; 			'(
;; 			  ("\\*.*$" . yellow-face)
;; 			  ))





;;modify outline-mode-map-prefix
;;经过此番修改，outline-mode与outline-minor-mode的按键一致

(add-hook 'outline-mode-hook
	  '(lambda ()
  (let ((map (make-sparse-keymap)))
    (define-key map "\C-o" outline-mode-prefix-map)
    (define-key map [menu-bar] outline-mode-menu-bar-map)
    (setq outline-mode-map map)
    )))


;; 使得标题高亮显示
(add-hook 'outline-minor-mode-hook
	  '(lambda ()

	     (hi-lock-set-pattern "^\\*[^*]*?$" 'cyan-face)
	     (hi-lock-set-pattern "^\\*\\*[^*]*?$" 'yellow-face)
	     (hi-lock-set-pattern "^\\*\\*\\*[^*]*?$" 'magenta-face)))

;; M-f1 打开outline-minor-mode
(global-set-key (quote [M-f1]) 'outline-minor-mode)

;;设置行距
(setq-default line-spacing 4)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;;插入utf8字符
;;(ucs-insert 174) ®
;;(ucs-insert 969) ω

;;新建C-c r 热键前缀，将browse-kill-ring 绑定在C-c r k
(require 'browse-kill-ring)
(define-prefix-command 'ctrl-c-r-map)
(global-set-key (kbd "C-c r") 'ctrl-c-r-map)
(global-set-key (kbd "C-c r k") 'browse-kill-ring)


;; ido ,used as helper when switch buffer or find a file
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching
;;(setq ido-save-directory-list-file t)

;;自定义C-x x 热键前缀
(define-prefix-command 'ctrl-x-x-map)
(global-set-key (kbd "C-x x") 'ctrl-x-x-map)
(global-set-key (kbd "C-x x b") 'emacs-lisp-byte-compile)

;;令按键迅速回显
(setq echo-keystrokes -1)

;;
;; (add-hook 'mouse-leave-buffer-hook
;; 	  '(lambda ()
;; 	     (message "鼠标离开选择区域")))

;;(define-key global-map [down-mouse-3] 'mouse-drag-region)
(global-set-key [(f1)] 'delete-other-windows)
;;(global-set-key [(f3)] 'split-window-horizontally)
;;c-return 执行当前sexp
(global-set-key (quote [C-return]) (quote eval-last-sexp))
;;M-f5 运行shell命令
(global-set-key (quote [M-f5]) (quote shell-command))
;;M-f2 显示行
(global-set-key (quote [M-f2]) '(lambda ()
				  (interactive)
				  (funcall 'linum-mode)))

;;python mode
 (add-hook 'python-mode-hook
           (lambda ()
             (set (make-variable-buffer-local 'beginning-of-defun-function)
                  'py-beginning-of-def-or-class)
			 (set-variable 'py-indent-offset 4)
			;; (smart-operator-mode-on)
             (setq outline-regexp "def\\|class ")))

;;用空格缩进
(setq-default indent-tabs-mode nil)

;;how to customlize imenu-tree?

;;(require 'imenu-tree)


;;设置hide region
(require 'hide-region)

(setq hide-region-before-string  "@[------------------------")
(setq  hide-region-after-string  "区域已隐藏----------------------]@")
(global-set-key "xh" (quote hide-region-hide))
(global-set-key "xs" (quote hide-region-unhide))
(global-set-key "xa" (quote hide-region-unhide-all))

;;toggle current buffer read-only state
(global-set-key "xr" 'toggle-read-only)


                                 
                                 
;;replace string in string
;;(replace-regexp-in-string "\\(hello\\) \\(world\\)" "\\2 \\1" "hello world")

;;设置compile
(defun change-to-cygwin-style-path (emacs-style-path-on-w32)
  (let ((full-path emacs-style-path-on-w32))
(if (eq system-type  "gnu/linux")
    full-path
    (replace-regexp-in-string "\\(\\w+?\\):\\(\\w*\\)" "/cygdrive/\\1\\2" full-path))))




(defvar my-compile-hook nil)

;;这是主函数，按f5执行此函数
(defun my-compile-main-fun ()
  (interactive)
  (run-hooks  'my-compile-hook))

;;这个函数用来编译现在用得到的语言写的代码，以后如果要用到其他语言，可以写个函数，然后加入到my-compile-hook中去。
(defun orginal-compile-fun ()
   (let ((mode major-mode)
	(compstr nil))
        (cond ((eq mode 'c-mode)
	   (setq compstr (concat "gcc -std=\"c99\" " (change-to-cygwin-style-path (buffer-file-name)))))
	  ((eq mode 'c++-mode)
	   (setq compstr (concat "c++  " (change-to-cygwin-style-path (buffer-file-name)))))
	  ((eq mode 'emacs-lisp-mode)
	   (emacs-lisp-byte-compile))
	  ((eq mode 'python-mode)
	   (setq compstr (concat "python " (buffer-file-name)))
	  )
	  ((or (eq mode 'cperl-mode) (eq mode 'perl-mode))
	   (setq compstr (concat "perl " (buffer-file-name))))
	  )
    (save-buffer)
    (if compstr 
	(compile compstr))))
;;将orginal-compile-fun加入my-compile-hook中
(add-hook 'my-compile-hook 'orginal-compile-fun)

;;将my-compile-main-fun 绑定到f5上
(global-set-key [(f5)] 'my-compile-main-fun)

;;octave-mode compile
(add-hook 'my-compile-hook '(lambda ()
                              (if (eq major-mode 'octave-mode)
                                  (progn
                                    (save-buffer)
                                    (compile (concat "octave --silent " (buffer-file-name)))))))


;;(setq my-compile-hook nil)

(global-set-key (kbd "C-x x f") 'ffap)

;;markdown-mode 
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.text"  .markdown-mode) auto-mode-alist))


;;set for minibuffer
;;(setq minibuffer-frame-alist nil)
;; (setq minibuffer-frame-alist
;;       '((top . 80) (left . 10) (width . 80) (height . 20)))



;;stardic
;; author: pluskid
(global-set-key (kbd "C-c d") 'kid-star-dict)
(defun kid-star-dict ()
  (interactive)
  (let ((begin (point-min))
        (end (point-max)))
    (if mark-active
        (setq begin (region-beginning)
              end (region-end))
      (save-excursion
        (backward-word)
        (mark-word)
        (setq begin (region-beginning)
              end (region-end))))
    ;; 有时候 stardict 会很慢，所以在回显区显示一点东西
    ;; 以免觉得 Emacs 在干什么其他奇怪的事情。
    (message "searching for %s ..." (buffer-substring begin end))
    (tooltip-show
     (shell-command-to-string
      (concat "sdcv -n "
              (buffer-substring begin end))))))


;; 调用 stardict 的命令行程序 sdcv 来查辞典
;; 如果选中了 region 就查询 region 的内容，否则查询当前光标所在的单词
;; 查询结果在一个叫做 *sdcv* 的 buffer 里面显示出来，在这个 buffer 里面
;; 按 q 可以把这个 buffer 放到 buffer 列表末尾，按 d 可以查询单词
(global-set-key (kbd "C-x xd") 'kid-sdcv-to-buffer)
(defun kid-sdcv-to-buffer ()
  (interactive)
  (let ((word (if mark-active
                  (buffer-substring-no-properties (region-beginning) (region-end))
                  (current-word nil t))))
    (setq word (read-string (format "Search the dictionary for (default %s): " word)
                            nil nil word))
    (set-buffer (get-buffer-create "*sdcv*"))
    (buffer-disable-undo)
    (erase-buffer)
    (let ((process (start-process-shell-command "sdcv" "*sdcv*" "sdcv" "-n" word)))
      (set-process-sentinel
       process
       (lambda (process signal)
         (when (memq (process-status process) '(exit signal))
           (unless (string= (buffer-name) "*sdcv*")
             (setq kid-sdcv-window-configuration (current-window-configuration))
             (switch-to-buffer-other-window "*sdcv*")
             (local-set-key (kbd "d") 'kid-sdcv-to-buffer)
             (local-set-key (kbd "q") (lambda ()
                                        (interactive)
                                        (bury-buffer)
                                        (unless (null (cdr (window-list))) ; only one window
                                          (delete-window)))))
           (goto-char (point-min))))))))


(load "~/xilbert-custom.el")




(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#304020" :foreground "navajo white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "文泉驿等宽微米黑")))))


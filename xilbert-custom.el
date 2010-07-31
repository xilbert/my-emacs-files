(set-scroll-bar-mode t)
(set-scroll-bar-mode 'right)
;;(set-scroll-bar-mode nil)
(add-hook 'my-compile-hook '(lambda ()
                              (if (eq major-mode 'makefile-gmake-mode)
                                  (progn
                                    (save-buffer)
                                    (compile "make -k")))))

(auto-fill-mode  nil)                                                                                                               

;;take current word as a parmeter to  isearch
(defun my-isearch-word ()
  (interactive)
  (when (not mark-active)
    (let (word-beg word-end)
      (unless (looking-at "\\<")
        (if (eq (char-syntax (char-after)) ?w)
            (backward-word)
          (and (forward-word) (backward-word))))
      (setq word-beg (point))
      (forward-word)
      (setq word-end (point))
      (setq my-isearch-word (filter-buffer-substring word-beg word-end nil t))
      (backward-word))
    (when (> (length my-isearch-word) 0)
      (kill-new my-isearch-word)
      (setq my-isearch-word (concat "\\<" my-isearch-word "\\>"))
      (isearch-update-ring my-isearch-word t)
      (add-hook 'isearch-mode-end-hook 'my-isearch-word-end-hook)
      (isearch-mode t t)
      (isearch-repeat 'forward)
      (message "%s" isearch-string))))

;;how to custom tool-bar
;;(setq tool-bar-map (make-sparse-keymap)) ;;clear current tool-bar
;;image-load-path ;;the icon path
(tool-bar-add-item "gud/run" 'gdb 'gdb
                   :visible '(memq major-mode '(c++-mode c-mode)))


(defun isearch-cur-word (fun)
  "ISearch current word use function FUN."
  (let ((cur-word (current-word)))
    (if (not cur-word)
        (message "No word under cursor.")
      (call-interactively fun)
      (isearch-yank-string cur-word))))

(defun isearch-forward-cur-word (&optional backward)
  "`isearch-forward' current word."
  (interactive "P")
  (let ((fun (if backward 'isearch-backward 'isearch-forward)))
    (isearch-cur-word fun)))
(global-set-key (quote [67108903]) (quote isearch-forward-cur-word))
;;set C-' to isearch-forward-cur-word


;;set for bak directory
(setq make-backup-files t)
(setq version-control t)
(setq backup-directory-alist (quote ((".*" .
"~/.emacs.d/emacs_backups/"))))
;;save one old version
(setq kept-old-versions 1)
;;save two new version
(setq kept-new-versions 2)
;;when version much then 2 ,delete in order
(setq delete-old-versions t)

(setq visual-line-mode 1)


;; set for org-mode
(setq org-publish-project-alist
      '(

        ("org-notes"
         :base-directory "~/org/"
         :base-extension "org"
         :publishing-directory "~/public_html/"
         :recursive t
         :publishing-function org-publish-org-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t
         )
        ("org-static"
         :base-directory "~/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/public_html/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("org" :components ("org-notes" "org-static"))

        ))
(setq org-pretty-entities t)
;;
;; turn on soft wrapping mode for org mode
(add-hook 'org-mode-hook
  (lambda () (setq truncate-lines nil)))
(add-hook 'org-mode-hook '(lambda ()
                            (define-key org-mode-map (kbd "<M-return>") 'org-insert-subheading)
                            (define-key org-mode-map (kbd "<C-return>") 'org-insert-heading)
                            ))
;;set for remember
;;----------------------------------------------------------------------
;;remember mode
;; (setq remember-annotation-functions '(org-remember-annotation))
;;  (setq remember-handler-functions '(org-remember-handler))
;;  (add-hook 'remember-mode-hook 'org-remember-apply-template)
;; ;;(org-remember-insinuate)
;; (define-key global-map "\C-cr" 'org-remember)
;; (define-key global-map "\C-cl" 'org-store-link)
;;----------------------------------------------------------------------

;;set for scroll-bar

;;set for muse
;;using muse-mode
(require 'muse-mode) ; load authoring mode
(require 'muse-html) ; load publishing styles I use
(require 'muse-project) ; publish files in projects
(setq muse-project-alist
      '(("mymuse" ("~/mymuse" :default "index")
         (:base "html" :path "~/public_html/mymuse"))))

;;add menu for muse
(easy-menu-define muse-mode-menu muse-mode-map
  "menu for muse"
  `("muse"
    ["muse-index" muse-index]
    ["muse-find-backlinks(pages)" muse-find-backlinks]
    ["add a tag"  muse-insert-tag]
    ["font lock toggle" font-lock-mode]
    "---"
    ["publish-this-file" muse-publish-this-file]
    ["publish-project" muse-project-publish]
    ["muse-browser-result" muse-browse-result]
    ["increase-list-item-ind" muse-increase-list-item-indentation]
    ["decrease-list-item-ind"    muse-decrease-list-item-indentation]
    ))
;;set style sheet for muse
(setq muse-html-style-sheet  "<link rel=\"stylesheet\" href=\"../../org/css/docbook.css\" type=\"text/css\"/>")        
(setq muse-xhtml-style-sheet  "<link rel=\"stylesheet\" href=\"../../org/css/docbook.css\" type=\"text/css\"/>")
;;insert tag
(add-hook 'muse-mode-hook '(lambda ()
(define-key muse-mode-map (kbd "C-c C-t") 'muse-insert-tag)
))

(delete-selection-mode 1) ; turn on behavior that delete or type-over selected text


(defun xilbert-delete-current-word ()
  (interactive)
 (let (beg end ls)
    (setq  ls (bounds-of-thing-at-point 'word))
    (setq beg (car ls))
    (setq end (cdr ls))
    (delete-region beg end)))

;;set c-M-d to xilbert-delete-current-word
(global-set-key (kbd "C-M-d") (quote xilbert-delete-current-word))


(defun xilbert-delete-to-line-beginning ()
  (interactive)
  (let (beg end)
    (save-excursion
      (setq beg (point))
      (beginning-of-line)
      (setq end (point))
      (delete-region beg end))))
;;set c-backspace to delete-to-line-beginning
(global-set-key (quote [C-backspace]) (quote  xilbert-delete-to-line-beginning))

(defun xilbert-get-char (pt)
      (buffer-substring-no-properties pt (1+ pt)))


(defun xilbert-delete-block ()
  (interactive)
  (let
      (
       (left 0)
       (right 0)
       (mypos 0)
       (lchar "")
       (rchar "")
       (ch "")
       (lstack nil)
       (rstack nil)
       (issearch 1)
       (mytable  '(("[" . "]")
                   ("]" . "[")
                   ("(" . ")")
                   (")" . "(")
                   ("{" . "}")
                   ("}" . "{")
                   ("<" . ">")
                   (">" . "<")))
       (my-search-str "\\[\\|\\]\\|(\\|)\\|<\\|>\\|\"\\|'")
       error-code1 ;; 1 repenset error happen befor ,2 is opposite , 0 is ok
       error-code2
       (lcaps '("[" "<" "(" "\"" "'"))
       (rcaps '("]" ">" ")" "\"" "'"))
       (lrcaps '("\"" "'"))
       )
    
    (save-excursion
      (setq error-code1 (block  outter-block
                          (setq mypos (point))
                          (while issearch
                            (setq issearch
                                  (re-search-backward my-search-str (point-min) t))
                            (setq ch (xilbert-get-char (point)))
                            (if (member ch lcaps)
                                (progn
                                  (cond ((and (> (length lstack) 0) (not (member ch lrcaps)))
                                         (let (key value item)
                                           (setq item (assoc  ch mytable))
                                           (setq value (cdr item))
                                           (if (equal value (car lstack)) ;; if matches ,pop lstack
                                               (pop lstack)
                                             (return-from outter-block 1)))) ;;return error code
                                        ((and (> ( length lstack) 0)
                                              (member ch lrcaps))
                                         (progn
                                           (if (member ch lstack)
                                               (setq lstack (cdr
                                                            (member ch lstack))) ;;pop until another ' ,or "
                                             (push ch lstack))))                    ;; if ch is not a member of lstack,just push lstack
                                              
                                        (t (push ch lstack))) ;;if lstack is empty ,just push lstack
                                  )
                              (push ch lstack)) ;;parse character is done
                            (when (and (equal (length lstack) 1)
                                       (member (car lstack) lcaps)
                                       (not (member (car lstack) lrcaps))
                                       )
                              (setq left (point))
                              (setq lchar ch)
                              (return-from outter-block 0))  ;;left search  successfully!
                            );;end of left search
                          (if (equal issearch nil)
                              (return-from outter-block 1))))
      (setq error-code2 (block outter-block
                          (goto-char mypos)
                          (while issearch
                            (setq issearch
                                  (re-search-forward my-search-str (point-max) t))
                            (setq ch (xilbert-get-char (1- (point))))
                            (if (member ch rcaps)
                                (progn
                                  (cond ((and (> (length rstack ) 0) (not (member ch lrcaps)))
                                         (let (key value item)
                                           (setq item (assoc ch mytable))
                                           (setq value (cdr item))
                                           (if (equal value (car rstack))
                                               (pop rstack)
                                             (return-from outter-block 2)))) ;;return 2 error code
                                        ((and (> (length rstack) 0)
                                              (member ch lrcaps))
                                         (if (member ch rstack)
                                             (setq rstack (cdr (member rstack)))
                                           (push ch rstack)))
                                             
                                        (t (push ch rstack))))
                              (push ch rstack)
                              )
                            (when (and (equal (length rstack) 1)
                                       (member (car rstack) rcaps)
                                       (not (member (car rstack) lrcaps))
                                       )
                              (setq right (point))
                              (setq rchar ch)
                              (return-from outter-block 0) ;;succefully
                              )) ;;end of search right
                          (when (not (equal lchar rchar))
                            (return-from outter-block 3))  ;;two side not mathced
                          )
            )
      (if (and (equal error-code1 0) (equal error-code2 0) (equal
                                                            (cdr (assoc lchar mytable)) rchar))
          
          (delete-region left right))
      )
    )
  )

;;set xilbert-delete-block to s-o
(global-set-key (quote [8388719]) (quote xilbert-delete-block))
;;set  key for kill-ring
(global-set-key (kbd "C-x x b") 'browse-kill-ring)

;;descibe-fun
(defun xilbert-descibe-fun-at-point ()
  "describe function at point"
  (interactive)
  (let (word)
    (setq word (current-word))
    (describe-function (intern-soft word))))

(global-set-key (kbd "C-x x d") 'xilbert-descibe-fun-at-point)

(defun xilbert-run-fun-at-point ()
  (interactive)
  (let (word)
    (setq word (current-word))
    (if (commandp (intern-soft word))
      (call-interactively
       (intern-soft word))
      (funcall (intern-soft word))
      )))
(global-set-key (kbd "C-x x r") 'xilbert-run-fun-at-point)

(defun run-shell-at-buffer ()
       (interactive)
       (let (command-string)
         (save-excursion
           (setq command-string  (buffer-substring-no-properties (region-beginning) (region-end) ))
           (goto-char (region-end))
           (newline)
           (insert (concat  "-------------output of " command-string "---------------\n"))
           (shell-command command-string (quote (4)) command-string)
           )))
(global-set-key (kbd "C-x x o") 'run-shell-at-buffer)

;(setq emacs-lisp-mode-hook (cdr emacs-lisp-mode-hook))

;;auto-complete configure
;; (require 'auto-complete-config)
;; (ac-config-default) 
;; (define-key ac-mode-map (kbd "M-TAB") 'auto-complete) 


(require 'auto-complete)
(require 'auto-complete-config)
(setq ac-auto-start nil)

;;所有打开的buffer都打开auto-complete-mode
;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                           (auto-complete-mode 1))
                       ))
(real-global-auto-complete-mode t)
;;(ac-set-trigger-key "C-/") 
(define-key ac-mode-map (kbd "M-/") 'auto-complete)
(apply-define-key
 ac-complete-mode-map
 `(("<return>"   ac-complete)
   ("RET"        nil)
   ("C-j"        ac-complete)
   ("<C-return>" ac-complete)
   ("C-n"        ac-next)
   ("C-p"        ac-previous)))
;;do what i mean
(setq ac-dwim t)

(set-default 'ac-sources
             '(;;ac-source-semantic
               ;;ac-source-yasnippet
               ;;ac-source-abbrev
               ac-source-words-in-buffer
               ac-source-words-in-all-buffer
               ;;ac-source-imenu
               ac-source-files-in-current-dir
               ac-source-filename))



;; when mark-active is not active ,just copy or kill current line                                                                       
(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy the current line."
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (progn
       (message "Current line is copied.")
       (list (line-beginning-position) (line-end-position)) ) ) ))

(defadvice kill-region (before slick-copy activate compile)
  "When called interactively with no active region, cut the current line."
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (progn
       (message "Current line is cut.")
       (list (line-beginning-position) (line-end-position)) ) ) ))
;;end of defadvice

;;set for cperl
(require 'cperl-mode)
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))
(add-hook 'cperl-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-h f") 'cperl-perldoc)))

(setq cperl-invalid-face (quote off)) ;;disable underline face
(cperl-set-style "K&R")


(require 'inf-perl)
(defalias  'run-perl 'inf-perl-start)
;;(setq perl-shell-program (expand-file-name "~/psh.pl"))

;;pod-mode
(require 'pod-mode)
(add-to-list 'auto-mode-alist '("\\.\\([pP][oO][Dd]\\)\\'" . pod-mode))
;;end

;; run interactively accroding major-mode
(defvar xilbert-inf-hook nil)
(defun xilbert-run-inf ()
  (interactive)
  (run-hooks 'xilbert-inf-hook))
(add-hook 'xilbert-inf-hook
          '(lambda ()
             (let (cmd mode)
               (setq mode major-mode)
               (cond ((or (eq mode 'perl-mode)
                           (eq mode 'cperl-mode))
                      (setq cmd 'run-perl))
                     ((or (eq mode 'octave-mode)
                         (eq mode 'matlab-mode))
                      (setq cmd 'run-octave))
                     ((eq mode 'haskell-mode)
                      (setq cmd 'run-haskell))
                     ((eq mode 'python-mode)
                      (setq cmd 'run-python))
                     ((eq mode 'lisp-mode)
                      (setq cmd 'run-lisp))
                     ((eq mode 'emacs-lisp-mode)
                      (setq cmd 'ielm))
                     ((eq mode 'scheme-mode)
                      (setq cmd 'run-scheme))
                     (t nil))
               (if cmd
               (funcall cmd)))))
               
(global-set-key (quote [f6]) 'xilbert-run-inf)
;;end

;;set for lua-mode
(setq auto-mode-alist (cons '("\\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-hook 'lua-mode-hook 'turn-on-font-lock)
(add-hook 'lua-mode-hook hs-minor-mode)

(defcustom ac-modes
  '(emacs-lisp-mode
    lisp-interaction-mode
    c-mode cc-mode c++-mode  java-mode
    perl-mode cperl-mode python-mode 
    javascript-mode   css-mode
    makefile-mode   
    lua-mode muse-mode org-mode)
  "Major modes `auto-complete-mode' can run on."
  :type '(repeat symbol)
  :group 'auto-complete)
;;end

;;提升c-c c-f 的速度
(setq tramp-default-method "ftp")

;;按C-c k 键删除选定内容
(global-set-key "k" (quote delete-region))
;;右键拖动选定内容
(define-key global-map [down-mouse-3] 'mouse-drag-region)

;;解决c-c 的问题
;; C-c s-h comment-region
(global-set-key (quote [3 8388712]) (quote comment-region))
;; c-c s-k uncomment-region
(global-set-key (quote [3 8388715]) (quote uncomment-region))
;;c-c M-w  kill-ring-save
(global-set-key "\367" (quote kill-ring-save))
;;c-c tool-bar-save 
(global-set-key (quote [3 (tool-bar)]) (quote clipboard-kill-ring-save))
(global-set-key (kbd "C-c C-M-\\") 'indent-region)
(global-set-key (kbd "C-c <DEL>") 'delete-region)
;;binding C-c o to occur-mode
(global-set-key (kbd "C-c o") 'occur)
;;hit C-c s to open shell
(global-set-key "\C-cs" 'shell)
;;use rf command to open emacs-lisp reference
(defalias 'rf 'menu-bar-read-lispref)

;;配置日历
(require 'calendar)
(global-set-key (kbd "<f12>") 'calendar)
;;配置mode-line 上时间显示的格式
(setq display-time-format "%m月%d日 %H点:%M分")
;;设置我所在地方的经纬度，calendar里有个功能是日月食的预测，和你的经纬度相联系的。
(setq calendar-latitude +39.9)
(setq calendar-longitude +116.4)
(setq calendar-location-name "西安")
;;设定一周的开始为周一
(setq calendar-week-start-day 1)
;;节日和生日提醒设置
;;希伯来人的节日和伊斯兰教的节日设为nil
;;我是无神论者，不过我喜欢神话，大家有兴趣也可以探讨一下，发email给我吧
(setq christian-holidays t) ;;基督教节日
(setq hebrew-holidays nil)
(setq islamic-holidays nil)
;;设定一些自定义的生日和节日
;;后面那些农历节日需要每年根据日历修改
;;有些可惜，没有中国传统农历，谁能写个扩展elisp包弄一下
;; (setq general-holidays '((holiday-fixed 1 1 "元旦")
;;                          (holiday-fixed 3 8 "妇女节")
;;                          (holiday-fixed 3 2 "杨欢的生日")
;;                          (holiday-fixed 4 1 "愚人节")
;;                          (holiday-fixed 5 1 "劳动节")
;;                          (holiday-fixed 9 10 "教师节")
;;                          (holiday-fixed 10 1 "国庆节")
;;                          (holiday-fixed 12 25 "圣诞节")
;;                          (holiday-float 5 0 2 "母亲节")
;;                          (holiday-float 6 0 3 "父亲节")
;;                          ))
;;日历不和日记相连，我不用Calendar自带的diary记日记
(setq mark-diary-entries-in-calendar nil)
;;在日历中突出标记节日和生日
(setq mark-holidays-in-calendar t)
;;打开calendar自动打开节日和生日列表
(setq view-calendar-holidays-initially t)
(setq calendar-date-style 'iso)
;;中文日历设置

;; (require 'cal-china-x)
;; (setq holiday-xilbert-holidays
;;       '(;;公历节日
;;         (holiday-fixed 1 1 "元旦")
;;         (holiday-fixed 2 14 "情人节")
;;         (holiday-fixed 3 8 "妇女节")
;;         (holiday-fixed 3 14 "白色情人节")
;;         (holiday-fixed 4 1 "愚人节")
;;         (holiday-fixed 5 1 "劳动节")
;;         (holiday-float 5 0 2 "母亲节")
;;         (holiday-fixed 6 1 "儿童节")
;;         (holiday-float 6 0 3 "父亲节")
;;         (holiday-fixed 9 10 "教师节")
;;         (holiday-fixed 10 1 "国庆节")
;;         (holiday-fixed 12 25 "圣诞节")
;;         ;; 农历节日
;;         (holiday-lunar 1 1 "春节" 0)
;;         (holiday-lunar 1 2 "春节" 0)
;;         (holiday-lunar 1 3 "春节" 0)
;;         (holiday-lunar 1 15 "元宵节" 0)
;;         (holiday-solar-term "清明" "清明节")
;;         (holiday-lunar 5 5 "端午节" 0)
;;         (holiday-lunar 8 15 "中秋节" 0)
;;         ;; 生日 -- 家人,朋友
;;         (holiday-fixed 3 2 "欢的生日")
;;         ))
;; (setq calendar-holidays holiday-xilbert-holidays)

;;滚屏更连续，而不是每次滚半屏
(setq scroll-step 1
      scroll-margin 1
      scroll-conservatively 10000)
;;set for anything
;; (require 'anything)
;;--------------------------------------------------------------------------------
;;set for viper
(eval-after-load 'viper
    '(progn
        (require 'vimpulse)
       (setq viper-vi-state-id (concat (propertize "<vi cmd>" 'face 'hi-blue-b) " "))
       (setq viper-emacs-state-id (concat (propertize "<E>" 'face 'hi-red-b) " "))
       (setq viper-insert-state-id (concat (propertize "<I>" 'face 'hi-blue-b) " "))
       (setq viper-replace-state-id (concat (propertize "<R>" 'face 'hi-blue-b) " "))
       ;; The property `risky-local-variable' is a security measure
       ;; for mode line variables that have properties
       (put 'viper-mode-string 'risky-local-variable t)
       (setq viper-expert-level 5)
       (define-key viper-insert-global-user-map [backspace] 'backward-delete-char-untabify)
       )
    )
;;--------------------------------------------------------------------------------
;;让滚轮不要滚动太快
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)((control)))
      mouse-wheel-follow-mouse 't
      mouse-wheel-progressive-speed nil
      scroll-step 1)
(require 'smooth-scrolling)
;;--------------------------------------------------------------------------------
;; ========== Place Backup Files in Specific Directory ==========

;; Enable backup files.
(setq make-backup-files t)

;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)

;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

;;--------------------------------------------------------------------------------
;;以tab 存储tab键
;;(setq-default indent-tabs-mode t)

;;----------------------------------------------------------------------
;;set for woman
(autoload 'woman "woman" "Browse man pages." t)
(setq woman-use-own-frame nil)
(global-set-key (kbd "<f8>") 'woman)
;;----------------------------------------------------------------------

;;----------------------------------------------------------------------
;;dot-mode
;;like vim dot opertor
;; Usage instructions:
;;
;; `C-.'    is bound to dot-mode-execute, which executes the buffer of
;;          stored commands as a keyboard macro.
;;
;; `C-M-.'  is bound to dot-mode-override, which will cause dot-mode
;;          to remember the next keystroke regardless of whether it
;;          changes the buffer and regardless of the value of the
;;          dot-mode-ignore-undo variable.
;;
;; `C-c-.'  is bound to dot-mode-copy-to-last-kbd-macro, which will
;;          copy the current dot mode keyboard macro to the last-kbd-macro
;;          variable.  It can then be executed via call-last-kbd-macro
;;          (normally bound to `C-x-e'), named via name-last-kbd-macro,
;;          and then inserted into your .emacs via insert-kbd-macro.
(require 'dot-mode)
(add-hook 'find-file-hooks 'dot-mode-on)
;;----------------------------------------------------------------

;;set for highlight-symbol
;;----------------------------------------------------------------------
;;hightlight symbol in this file

;; (require 'highlight-symbol)

;; (global-set-key [(control f3)] 'highlight-symbol-at-point)
;; (global-set-key [f3] 'highlight-symbol-next)
;; (global-set-key [(shift f3)] 'highlight-symbol-prev)
;; (global-set-key [(meta f3)] 'highlight-symbol-prev)
;;----------------------------------------------------------------------
;;M-F4 重复命令
(global-set-key '[M-f4] 'repeat-complex-command)
;;C-/ join-line
(global-set-key (kbd "C-/") 'join-line)
;;--------------------------------------------------
;;kmacro mangle
;;keyboard macro manage ;;bind to C-x M-e
(defun xilbert-kmacro-manage (arg)
  (interactive (list
                (string-to-number
                 (read-string "[(f:-1)&(b:1)&(e:0)&(2:i)&(3:k)&(4:n)]:" nil 'xilbert-history))))
  (let (cmd)
    (cond ((equal arg -1)
           (setq cmd 'kmacro-cycle-ring-previous))
          ((equal arg 1)
           (setq cmd 'kmacro-cycle-ring-next))
          ((equal arg 0)
           (setq cmd 'kmacro-edit-macro))
          ((equal arg 2)
           (setq cmd 'insert-kbd-macro))
          ((equal arg 3)
           (setq cmd 'kmacro-bind-to-key))
          ((equal arg 4)
           (setq cmd 'kmacro-bind-to-key)))
    (call-interactively cmd)
    )
  )
(global-set-key (kbd "C-x M-e") 'xilbert-kmacro-manage)
;;--------------------------------------------------

(require 'kmacro-ring-list)
(global-set-key (kbd "C-x m") 'kmacro-ring-list)



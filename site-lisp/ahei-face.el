;; -*- Emacs-Lisp -*-

;; Time-stamp: <2009-11-25 15:15:05 Wednesday by ahei>

;; ���Զ����һЩface
(defface white-face
  '((((class color)) :foreground "white"))
  "���Զ����white face")
(defface white-red-face
  '((((class color) (background dark)) (:foreground "white" :background "red")) (t ()))
  "���Զ����white-red face")
(defface red-face
  '((((class color)) :foreground "red"))
  "���Զ����red face")
(defface darkred-face
  '((((type tty pc)) :bold t :foreground "red") (t (:foreground "red")))
  "���Զ����dark red face")
(defface red-face
  '((((class color) (background dark)) (:foreground "red")) (t ()))
  "���Զ����red face")
(defface green-face
  '((((class color)) :foreground "green"))
  "���Զ����green face")
(defface darkgreen-face
  '((((type tty pc)) :bold t :foreground "green") (t (:foreground "green")))
  "���Զ����dark green face")
(defface blue-face
  '((((type tty pc)) :foreground "blue") (t (:foreground "blue")))
  "���Զ����blue face")
(defface light-blue-face
  '((((type tty pc)) :foreground "blue")
    (t :foreground "cornflower blue"))
  "����ɫ.")
(defface beautiful-blue-face
  '((((class grayscale) (background light)) (:foreground "LightGray" :weight bold))
    (((class grayscale) (background dark)) (:foreground "DimGray" :weight bold))
    (((class color) (min-colors 88) (background light)) (:foreground "Orchid"))
    (((class color) (min-colors 88) (background dark)) (:foreground "cornflower blue"))
    (((class color) (min-colors 16) (background light)) (:foreground "Orchid"))
    (((class color) (min-colors 16) (background dark)) (:foreground "LightSteelBlue"))
    (((class color) (min-colors 8)) (:foreground "blue" :weight bold))
    (t (:weight bold)))
  "Ư������ɫ.")
(defface beautiful-blue-red-face
  '((((class grayscale) (background light)) (:foreground "red" :background "LightGray" :weight bold))
    (((class grayscale) (background dark)) (:foreground "red" :background "DimGray" :weight bold))
    (((class color) (min-colors 88) (background light)) (:foreground "red" :background "Orchid"))
    (((class color) (min-colors 88) (background dark)) (:foreground "red" :background "cornflower blue"))
    (((class color) (min-colors 16) (background light)) (:foreground "red" :background "Orchid"))
    (((class color) (min-colors 16) (background dark)) (:foreground "red" :background "LightSteelBlue"))
    (((class color) (min-colors 8)) (:foreground "red" :background "blue" :weight bold))
    (t (:weight bold)))
  "����ɫΪƯ������ɫ, ǰ��ɫΪ��ɫ.")
(defface darkblue-face
  '((((type tty pc)) :bold t :foreground "blue") (t (:foreground "blue")))
  "���Զ����dark blue face")
(defface lightblue-face
  '((((type tty pc)) :foreground "blue")
    (t :foreground "cornflower blue"))
  "���Զ����lightblue face")
(defface yellow-face
  '((t :foreground "yellow"))
  "���Զ����yellow face")
(defface darkyellow-face
  '((((type tty pc)) :bold t :foreground "yellow") (t (:foreground "yellow")))
  "���Զ����dark yellow face")
(defface cyan-face
  '((t :foreground "cyan"))
  "���Զ����cyan face")
(defface darkcyan-face
  '((((type tty pc)) :bold t :foreground "cyan") (t (:foreground "cyan")))
  "���Զ����dark cyan face")
(defface magenta-face
  '((((class color)) :foreground "magenta"))
  "���Զ����magenta face")
(defface darkmagenta-face
  '((((type tty pc)) :bold t :foreground "magenta") (t (:foreground "magenta")))
  "���Զ����magenta face")
(defface underline-green-face
  '((((class color) (background dark)) (:underline t :foreground "green")) (t ()))
  "���Զ����underline green face")
(defface underline-face
  '((((class color) (background dark)) (:underline t)) (t ()))
  "���Զ����underline face")
(defface black-red-face
  '((((class color) (background dark)) (:foreground "black" :background "red")) (t ()))
  "���Զ����black-red face")
(defface green-red-face
  '((((class color) (background dark)) (:foreground "green" :background "red")) (t ()))
  "���Զ����green-red face")
(defface yellow-red-face
  '((((class color) (background dark)) (:foreground "yellow" :background "red")) (t ()))
  "���Զ����yellow-red face")
(defface yellow-blue-face
  '((((class color) (background dark)) (:foreground "yellow" :background "blue")) (t ()))
  "���Զ����yellow-blue face")
(defface yellow-forestgreen-face
  '((((class color) (background dark)) (:foreground "yellow" :background "forest green")) (t ()))
  "���Զ����yellow-forestgreen face")
(defface red-yellow-face
  '((((class color) (background dark)) (:foreground "red" :background "yellow")) (t ()))
  "���Զ����red-yellow face")
(defface red-blue-face
  '((((class color) (background dark)) (:foreground "red" :background "blue")) (t ()))
  "���Զ����red-blue face")

(defface region-invert nil "Invert of face region.")

(apply-args-list-to-fun
 'defvar
 `((beautiful-blue-face 'beautiful-blue-face)
   (darkgreen-face      'darkgreen-face)
   (darkred-face        'darkred-face)
   (darkyellow-face     'darkyellow-face)
   (darkmagenta-face    'darkmagenta-face)
   (darkcyan-face       'darkcyan-face)
   (yellow-face         'yellow-face)
   (green-face          'green-face)
   (cyan-face           'cyan-face)))

(provide 'ahei-face)

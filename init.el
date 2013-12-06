;; Turn off mouse interface early in startup to avoid momentary display
;; You really don't need these; trust me.

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))


;;
;; ELPA
;;

(add-to-list 'load-path "~/.emacs.d/elpa")

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)


;;
;; Magit
;;

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-c b") 'magit-blame-mode)


;;
;; Themes/General
;;

(load-theme 'underwater t)

(column-number-mode)


;;
;; Org Mode
;;

(setq org-log-done 'time) ;; log when tasks are marked done

;; show total times only as hours:minutes
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))


;; Set to the location of your Org files on your local system
(setq org-directory "~/work/org-files")

;; org-mode zeroton.in blog publishing settings

(setq org-publish-project-alist
      '(
	("org-zerotonin"
	 ;; Path to your org files.
	 :base-directory "~/work/zeroton.in/org/"
	 :base-extension "org"

	 ;; Path to your Jekyll project.
	 :publishing-directory "~/work/zeroton.in/jekyll/"
	 :recursive t
	 :publishing-function org-publish-org-to-html
	 :headline-levels 4
	 :html-extension "html"
	 :body-only t ;; Only export section between <body> </body>
	 )


	("org-static-zerotonin"
	 :base-directory "~/work/zeroton.in/org/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
	 :publishing-directory "~/work/zeroton.in/"
	 :recursive t
	 :publishing-function org-publish-attachment)

	("zerotonin" :components ("org-zerotonin" "org-static-zerotonin"))))

(global-set-key (kbd "C-c e") 'org-publish-project)

;;
;; Clojure/paredit
;;

(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)
(add-hook 'clojure-mode-hook 'highlight-parentheses-mode)


;;
;; Yas snippets
;;
(yas-global-mode)

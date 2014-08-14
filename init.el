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

;; clojure-mode indent for peripheral components
(put 'defcomponent 'clojure-backtracking-indent '(4 4 (2)))

;;
;; Yas snippets
;;
(yas-global-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-safe-themes (quote ("1278386c1d30fc24b4248ba69bc5b49d92981c3476de700a074697d777cb0752" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "8020f88a6175dc3c79d53072c8c677a14a3d24fa165b740995bace5870ae9157" "2affb26fb9a1b9325f05f4233d08ccbba7ec6e0c99c64681895219f964aac7af" "60e70079a187df634db25db4bb778255eaace1ef4309e56389459fb9418b4840" "1f3304214265481c56341bcee387ef1abb684e4efbccebca0e120be7b1a13589" "7a2c92b6267b84ae28a396f24dd832e29a164c1942f1f8b3fe500f1c25f8e09d" "e3897e34374bb23eac6c77e5ab0eba99b875f281a3b3b099ca0dc46aab25bbd5" "d63e19a84fef5fa0341fa68814200749408ad4a321b6d9f30efc117aeaf68a2e" "450b29ed22abeeac279b7eeea592f4eea810105737716fc29807e1684e729c55" "eacfc96fbe418c017f4a00fdde5d5029db8e2800a46251eb2174484fa431917e" "1a093e45e4c3e86fa5ad1f8003660e7cda4d961cd5d377cee3fee2dad2faf19b" "865d6cb994f89c13b2d7e5961df4eabeea12494583c240c8fe9a788d0f4ee12c" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "d0ff5ea54497471567ed15eb7279c37aef3465713fb97a50d46d95fe11ab4739" "d971315c813b0269a86e7c5e73858070063016d9585492bd8d0f27704d50fee7" "b8f561a188a77e450ab8a060128244c81dea206f15c1152a6899423dd607b327" default)))
 '(org-agenda-files (quote ("~/work/org-files/sf.org" "~/work/org-files/personal.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

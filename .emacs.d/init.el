(require 'package)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(add-to-list 'default-frame-alist '(font . "ricty-12"))

;; 環境を日本語、UTF-8にする
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; スタートアップメッセージを表示させない
(setq inhibit-startup-message t)

;; ターミナルで起動したときにメニューを表示しない
(if (eq window-system 'x)
    (menu-bar-mode 1) (menu-bar-mode 0))
(menu-bar-mode nil)

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;; 選択領域を削除キーで一括削除
(delete-selection-mode t)

;; shift + 矢印キーで領域選択
(if (fboundp 'pc-selection-mode)
    (pc-selection-mode))

;; png, jpg などのファイルを画像として表示
(setq auto-image-file-mode t)

;; リージョンのハイライト
(transient-mark-mode 1)

;; タイトルにフルパス表示
(setq frame-title-format "%f")

;;current directory 表示
(let ((ls (member 'mode-line-buffer-identification
                  mode-line-format)))
  (setcdr ls
    (cons '(:eval (concat " ("
            (abbreviate-file-name default-directory)
            ")"))
            (cdr ls))))

;; 行頭 kill-line (C-k) で行全体をカット
(setq kill-whole-line t)
;; 読み取り専用バッファーでもカット系でコピー可能
(setq kill-read-only-ok t)

;; バックアップファイルを作成させない
(setq make-backup-files nil)

;; lockfile 実行の有無
(setq create-lockfiles nil)

;; 終了時にオートセーブファイルを削除する
(setq delete-auto-save-files t)

;; タブにスペースを使用する
;;(setq-default tab-width 4 indent-tabs-mode nil)

;; 改行コードを表示する
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

;; 複数ウィンドウを禁止する
(setq ns-pop-up-frames nil)

;; ウィンドウを透明にする
;; アクティブウィンドウ／非アクティブウィンドウ（alphaの値で透明度を指定）
(add-to-list 'default-frame-alist '(alpha . (0.85 0.85)))

;; ツールバーを消す
(tool-bar-mode -1)

;; 列数を表示する
(column-number-mode t)

;; 行数を表示する
(global-linum-mode t)

;; カーソルの点滅をやめる
(blink-cursor-mode 0)

;; カーソル行をハイライトする
(global-hl-line-mode t)

;; 対応する括弧を光らせる
(show-paren-mode 1)

;; ウィンドウ内に収まらないときだけ、カッコ内も光らせる
;;(setq show-paren-style 'mixed)
;;(set-face-background 'show-paren-match-face "grey")
;;(set-face-foreground 'show-paren-match-face "black")

;; スクロールは１行ごとに
(setq scroll-conservatively 1)

;; 1 画面スクロール時に重複させる行数
(setq next-screen-context-lines 10)

;; 1 画面スクロール時にカーソルの画面上の位置をなるべく変えない
(setq scroll-preserve-screen-position t)


;; C-kで行全体を削除する
(setq kill-whole-line t)

;;; dired設定
(require 'dired-x)

;; "yes or no" の選択を "y or n" にする
(fset 'yes-or-no-p 'y-or-n-p)

;; beep音を消す
(setq ring-bell-function 'ignore)

;; color theme
(setq custom-theme-directory "~/.emacs.d/themes/")
(load-theme 'atom-one-dark t)
;;(load-theme 'zenburn t)
;;(load-theme 'wheatgrass t)

;; alpha
(if window-system
    (progn
      (set-frame-parameter nil 'alpha 95)))

;; 非アクティブウィンドウの背景色を設定
(require 'hiwin)
(hiwin-activate)
(set-face-background 'hiwin-face "gray30")

;; dabbrev 時の置換
(setq dabbrev-case-replace nil)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit rainbow-delimiters auto-complete hiwin ess yasnippet company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; 起動時のフレーム設定
(setq initial-frame-alist
      (append (list
               '(top . 50)
               '(left . 50)
               '(width . 100)
               '(height . 40)
               )
              initial-frame-alist))
(setq default-frame-alist initial-frame-alist)

 ;; オプションの "Ignore Case for Search" で設定可
 ;;
 ;; ;; 検索(全般)
 ;; (setq case-fold-search t)
 ;;
 ;; ;; インクリメンタルサーチ
 ;; (setq isearch-case-fold-search nil)


 ;; バッファー名の検索
 (setq read-buffer-completion-ignore-case t)

 ;; ファイル名の検索
 (setq read-file-name-completion-ignore-case t)

 (when (require 'auto-complete-config nil t)
   (ac-config-default))

 ;; 空白を一度に削除
 (if (fboundp 'global-hungry-delete-mode)
     (global-hungry-delete-mode 1))

 ;; 改行時などに自動でインデント
 ;;   (C-j と C-m の入れ替え)
 (if (fboundp 'electric-indent-mode)
     (electric-indent-mode 0))

;; C 系共通
 ;; ================================================================

 (defun my-all-cc-mode-init ()
   ;; C 系(cc-mode を継承した)モード共通の設定を記述

   ;; 空白などを一度に削除
   (c-toggle-hungry-state 1)

   ;; 改行時などで自動インデント
   ;; (c-toggle-electric-state 1)
   ;;
   ;; ";", "}" などを入力したときに自動改行
   ;; 自動インデントも一緒に ON になる
   ;; (c-toggle-auto-newline 1)

   )
 (add-hook 'c-mode-common-hook 'my-all-cc-mode-init)

 ;; .h でも C++
 (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

 ;; ediff 時にフレームを使わない
 (setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; https://github.com/Fanael/rainbow-delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; git関係
;; git-gutter-fringe
(global-git-gutter-mode t)

;; magit
(global-set-key (kbd "C-c C-g") 'magit-diff-working-tree)
(global-set-key (kbd "C-x g") 'magit-status)

;; ファイル編集時に，bufferを再読込
(global-auto-revert-mode 1)


;; ファイルの保存時に行末のスペースや末尾の改行を削除する
;; https://qiita.com/itiut@github/items/4d74da2412a29ef59c3a
(require 'whitespace)
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         spaces         ; スペース
                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         tab-mark
                         ))

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

;; スペースは全角のみを可視化
(setq whitespace-space-regexp "\\(\u3000+\\)")

;; 保存前に自動でクリーンアップ
(setq whitespace-action '(auto-cleanup))

(global-whitespace-mode 1)

(defvar my/bg-color "#232323")
(set-face-attribute 'whitespace-trailing nil
                    :background my/bg-color
                    :foreground "DeepPink"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :background my/bg-color
                    :foreground "LightSkyBlue"
                    :underline t)
(set-face-attribute 'whitespace-space nil
                    :background my/bg-color
                    :foreground "GreenYellow"
                    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
                    :background my/bg-color)

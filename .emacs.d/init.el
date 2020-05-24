(require 'package)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(add-to-list 'default-frame-alist
	'(font . "ricty-12"))

(setq x-select-enable-clipboard t)

(require 'helm-config)
(helm-descbinds-mode)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
(package-install 'helm-c-moccur)
(when (require 'helm-c-moccur nil t)
  (setq
   ;; 執筆時点でエラーが出たため定義しているが、
   ;; 将来的には不要になる可能性が高い
   helm-idle-delay 0.1
   ;; helm-c-moccur用 `helm-idle-delay'
   helm-c-moccur-helm-idle-delay 0.1
   ;; バッファの情報をハイライトする
   helm-c-moccur-higligt-info-line-flag t
   ;; 現在選択中の候補の位置をほかのwindowに表示する
   helm-c-moccur-enable-auto-look-flag t
   ;; 起動時にポイントの位置の単語を初期パターンにする
   helm-c-moccur-enable-initial-pattern t)
  ;; C-M-oにhelm-c-moccur-occur-by-moccurを割り当てる
  (global-set-key (kbd "C-M-o") 'helm-c-moccur-occur-by-moccur))

(when (require 'color-moccur nil t)
  ;; M-oにoccur-by-moccurを割り当て
  (define-key global-map (kbd "M-o") 'occur-by-moccur)
  ;; スペース区切りでAND検索
  (setq moccur-split-word t)
  ;; ディレクトリ検索のとき除外するファイル
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$"))

;; moccur-editの設定
(require 'moccur-edit nil t)
;; moccur-edit-finish-editと同時にファイルを保存する
(defadvice moccur-edit-change-file
  (after save-after-moccur-edit-buffer activate)
  (save-buffer))

;;; P133 grepの結果を直接編集 wgrep
(require 'wgrep nil t)

;;; P135 編集履歴の記憶 undohist
(when (require 'undohist nil t)
  (undohist-initialize))

;;; P136 アンドゥの分岐履歴 undo-tree
(when (require 'undo-tree nil t)
  ;; C-'にリドゥを割り当てる
  (define-key global-map (kbd "C-'") 'undo-tree-redo)
  (global-undo-tree-mode))

;;; P137 カーソルの移動履歴 point-undo (deprecated?)
;;(when (require 'point-undo nil t)
;;   (define-key global-map (kbd "M-[") 'point-undo)
;;   (define-key global-map (kbd "M-]") 'point-redo)
;;  )
(when (require 'goto-last-point nil t)
  (define-key global-map (kbd "C-<") 'goto-last-point))

(when (require 'goto-last-change nil t)
  (define-key global-map (kbd "\C-x\C-p") 'goto-last-change))

;;; P139 ウィンドウの分割状態を管理──ElScreen
(when (require 'elscreen nil t)
  (elscreen-start)
  ;; C-z C-zをタイプした場合にデフォルトのC-zを利用する デフォルトはウィンドウ最小化
  ;;  (if window-system
  ;;      (define-key elscreen-map (kbd "C-z") 'iconify-or-deiconify-frame)
  ;;    (define-key elscreen-map (kbd "C-z") 'suspend-emacs))
)

;;; P141-144 メモ書き・ToDo管理 howm
(setq howm-directory (concat user-emacs-directory "howm"))
;; howm-menuの言語を日本語に
(setq howm-menu-lang 'ja)
;; howmメモを1日1ファイルにする
; (setq howm-file-name-format "%Y/%m/%Y-%m-%d.howm")
;; howm-modeを読み込む
(when (require 'howm-mode nil t)
  (define-key global-map (kbd "C-c ,,") 'howm-menu))

;; howmメモを保存と同時に閉じる
(defun howm-save-buffer-and-kill ()
  "howmメモを保存と同時に閉じます。"
  (interactive)
  (when (and (buffer-file-name)
             (howm-buffer-p))
    (save-buffer)
    (kill-buffer nil)))

;; C-c C-cでメモの保存と同時にバッファを閉じる
(define-key howm-mode-map (kbd "C-c C-c") 'howm-save-buffer-and-kill)

;; cua-modeの設定
(cua-mode t) ; cua-modeをオン
(setq cua-enable-cua-keys nil) ; CUAキーバインドを無効にする

;; perl-modeをcperl-modeのエイリアスにする
(defalias 'perl-mode 'cperl-mode)

;;; P168 python-mode
;; C-c C-v で構文check
(setq python-check-command "flake8")

;; Flycheck: 文法チェックを実行する
(add-hook 'after-init-hook #'global-flycheck-mode)

;;; 機能を追加する
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))


(defun elisp-mode-hooks ()
  "lisp-mode-hooks"
  (when (require 'eldoc nil t)
    (setq eldoc-idle-delay 0.2)
    (setq eldoc-echo-area-use-multiline-p t)
    (turn-on-eldoc-mode)))

;; Emacs26 + VcXsrv はダブルバッファリングのバグのせいでXウィンドウだと表示されない
;;https://fujii.github.io/2018/08/30/emacs-on-wslinux/
;;https://blog.pluser.net/posts/2018/emacs-double-buffering-cause-cursor-flickering/
(set-frame-parameter nil 'inhibit-double-buffering t)

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

;; 折り返しトグルコマンド
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)
;; "C-t" でウィンドウを切り替える。初期値はtranspose-chars
(define-key global-map (kbd "C-t") 'other-window)

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
;;(setq make-backup-files nil)
;; 終了時にオートセーブファイルを削除する
;;(setq delete-auto-save-files t)

;; バックアップとオートセーブファイルを~/.emacs.d/backups/へ集める
(add-to-list 'backup-directory-alist
             (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

;; オートセーブファイル作成までの秒間隔
(setq auto-save-timeout 15)
;; オートセーブファイル作成までのタイプ間隔
(setq auto-save-interval 60)

;; ファイルが #! から始まる場合、+xを付けて保存する
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)


;; lockfile 実行の有無
(setq create-lockfiles nil)

;; タブにスペースを使用する
(setq-default tab-width 4 indent-tabs-mode nil)

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
(defface my-hl-line-face
  ;; 背景がdarkならば背景色を紺に
  '((((class color) (background dark))
     (:background "NavyBlue" t))
    ;; 背景がlightならば背景色を青に
    (((class color) (background light))
     (:background "LightSkyBlue" t))
    (t (:bold t)))
  "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)
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

;; dired設定
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
    (quickrun flycheck-pycheckers flycheck-perl6 flycheck-clang-tidy flycheck-pos-tip flycheck howm elscreen goto-last-point ## undo-tree undohist wgrep moccur-edit git-gutter helm-descbinds whitespace-cleanup-mode magit rainbow-delimiters auto-complete hiwin ess yasnippet company))))
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
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default)
  (setq ac-use-menu-map t)
  (setq ac-ignore-case nil))

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

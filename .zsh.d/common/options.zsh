# 補完に関するオプション
fpath=($fpath ~/.zsh/completion)
autoload -U compinit
compinit
setopt auto_param_slash
setopt mark_dirs
setopt list_types
setopt auto_menu
setopt auto_param_keys
setopt interactive_comments	# '#' 以降をコメントとして扱う
setopt magic_equal_subst	# '=' 以降も補完する
setopt complete_in_word
setopt always_last_prompt
bindkey "^[[Z" reverse-menu-complete	# Shift-Tabで補完候補を逆順する

setopt print_eight_bit	# 日本語ファイル名を表示可能にする
setopt extended_glob
setopt globdots
setopt list_packed
HISTFILE=~/.zsh_history	# ヒストリを保存するファイル
HISTSIZE=1000000		# メモリに保存されるヒストリの件数
SAVEHIST=1000000		# 保存されるヒストリの件数

setopt pushd_ignore_dups	# 重複したディレクトリを追加しない
setopt share_history		# 同時に起動したzsh間においてヒストリを共有する
setopt hist_ignore_all_dups	# 同じコマンドをヒストリに残さない
setopt hist_ignore_space	# スペースから始まるコマンド行はヒストリに残さない
setopt hist_reduce_blanks	# ヒストリに保存するときに余分なスペースを削除する
#色付け等の設定=================================================================
autoload -U colors ; colors		# 色の設定(プロンプトに色付けをおこなう)
export LSCOLORS=GxHxcxdxCxegedabagacad
export LS_COLORS='di=94:ln=35:so=32:pi=33:ex=92:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}	# ファイル補完候補にも色付けをおこなう

setopt no_beep			# beepを無効化
setopt no_flow_control	# フローコントロールを無効化
setopt ignore_eof		# Ctrl+Dでのzsh終了を無効化
setopt auto_cd			# ディレクトリ名のみでもcdする
setopt auto_pushd		# cdしたら自動的にpushdする


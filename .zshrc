
# .zshrc
# When you want to reload zsh files, type this command "exec zsh".

ZSH_HOME="${HOME}/.zsh.d"
# "-d 'file'" returns true if 'file' is a directory.
# "cond1 -a cond2" returns true if both conditions are ture.
# "-r 'file'" returns true if 'file' is able to be read.
# "-x 'file'" returns true if 'file' is executable one.
if [ -d $ZSH_HOME -a -r $ZSH_HOME -a -x $ZSH_HOME ]; then
	for i in $ZSH_HOME/*; do
		# "${i##*/}" returns matched string from end up to '/'.
		# This is a regular expression.
		# First condition passes only "*.zsh" files in "ZSH_HOME" directory.
		# "-o" is "or" operator.
		# "-h 'file'" returns true if 'file' exists and it is a symbolic link.
		[[ ${i##*/} = *.zsh ]] && [ \( -f $i -o -h $i \) -a -r $i ] && . $i

		# Show loaded files. (If No need, comment out below one line.)
		#echo $i
	done
fi

# 補完に関するオプション
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

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'	# 補完において、小文字入力に対して大文字もマッチさせる
zstyle ':completion:*:default' menu select=2		# 補完候補を、矢印でも選択できるようにする
zstyle ':completion:*' ignore-parents parent pwd ..	# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

autoload -Uz select-word-style			# 単語の区切り文字を指定する
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"	# ここで指定した文字は単語区切りとみなされる
zstyle ':zle:*' word-style unspecified

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
export LSCOLORS=exfxcxdxbxegedabagacad	# Get 'ls' command colorized
export LS_COLORS='di=94:ln=35:so=32:pi=33:ex=92:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}	# ファイル補完候補にも色付けをおこなう

setopt no_beep			# beepを無効化
setopt no_flow_control	# フローコントロールを無効化
setopt ignore_eof		# Ctrl+Dでのzsh終了を無効化
setopt auto_cd			# ディレクトリ名のみでもcdする
setopt auto_pushd		# cdしたら自動的にpushdする

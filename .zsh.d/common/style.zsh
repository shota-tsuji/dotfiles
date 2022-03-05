zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'	# 補完において、小文字入力に対して大文字もマッチさせる
zstyle ':completion:*:default' menu select=2		# 補完候補を、矢印でも選択できるようにする
zstyle ':completion:*' ignore-parents parent pwd ..	# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

autoload -Uz select-word-style			# 単語の区切り文字を指定する
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{}[]()<>,.-|*?!_~&#$%^"	# ここで指定した文字は単語区切りとみなされる
zstyle ':zle:*' word-style unspecified

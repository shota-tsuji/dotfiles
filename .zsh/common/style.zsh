autoload -Uz select-word-style			# 単語の区切り文字を指定する
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{}[]()<>,.-|*?!_~&#$%^"	# ここで指定した文字は単語区切りとみなされる
zstyle ':zle:*' word-style unspecified

if g:_is_plugged("vim-smartinput")
	call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
	call smartinput#define_rule({
			\ 	'at'	: '(\%#)',
			\	'char'	: '<Space>',
			\	'input'	: '<Space><Space><Left>',
			\	})
	call smartinput#define_rule({
			\	'at'	: '( \%# )',
			\	'char'	: '<BS>',
			\	'input'	: '<Del><BS>',
			\	})
	" 改行時に行末スペースの除去
	call smartinput#define_rule({
			\	'at'	: '\s\+\%#',
			\	'char'	: '<CR>',
			\	'input'	: "<C-o>:call setline('.', substitute(getline('.'), '\\s\\+$', '', ''))<CR><CR>",
			\	})
	" C++で;を忘れないようにする
	call smartinput#define_rule({
			\	'at'	: '\%(\<struct\>\|\<class\>\|\<enum\>\)\s*\w\+.*\%#',
			\	'char'	: '{',
			\	'input'	: '{};<Letf><Left>',
			\	'filetype'	: ['cpp'],
			\	})
endif

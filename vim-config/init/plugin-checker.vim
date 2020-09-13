" 使用していないがイディオムとして残しておいた．
let s:plug = {
			\ "plugs": get(g:, 'plugs', {})
			\ }

function! s:plug.is_installed(name) "関数の再定義：
	return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction

" check the specified plugin is installed.
" 前置子'g:'：グローバル定義
" '!'：関数の再定義
function! g:_is_plugged(name)
	if exists('g:plugs') && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
		return 1
	else
		return 0
	endif
endfunction

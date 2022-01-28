" automate to change the current directory in each window
" autocmd BufEnter * silent! cd %:p:h

nnoremap <Space>cd :cd %:p:h<CR>

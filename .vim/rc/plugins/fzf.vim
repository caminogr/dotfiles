" let fzf_path = system('which fzf')
" set rtp+=fzf_path
" set rtp+=/usr/bin/fzf

" let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
let $FZF_DEFAULT_COMMAND = 'rg -l ""'
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>p :Files<CR>
nnoremap <Leader>g :GFiles?<CR>
nnoremap <Leader>r :Rg 
nnoremap <Leader>ft :Tags<CR>
nnoremap <Leader>fm :History<CR>

command! -bang -nargs=* Files
    \ call fzf#run(fzf#wrap({
    \   'source': 'rg --files --hidden --follow --glob "!.git/*"',
    \   'options': '--multi --preview "bat  --style=numbers --color=always --line-range :500 {}"'
    \ }), <bang>0)

run ripgrep with :Rg
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
\   <bang>0 ? fzf#vim#with_preview('right:50%:hidden', '?')
\           : fzf#vim#with_preview('up:60%'),
\   <bang>0)

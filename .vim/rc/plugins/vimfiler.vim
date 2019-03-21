let g:vimfiler_as_default_explorer   = 1
let g:vimfiler_safe_mode_by_default  = 0
let g:vimfiler_ignore_pattern = '\%(.pyc\)$'
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'

noremap  <C-T> :VimFilerExplorer<cr>
nnoremap sn <C-w>t

augroup vimFiler
  autocmd!
  autocmd FileType vimfiler nnoremap <buffer>v v 
  autocmd FileType vimfiler nnoremap <buffer>h h
  autocmd FileType vimfiler nnoremap <buffer>l l
  autocmd FileType vimfiler nnoremap <buffer>t t
  autocmd FileType vimfiler nnoremap <buffer>s s
  autocmd FileType vimfiler nnoremap <buffer><Space> <Space>
  autocmd FileType vimfiler nmap     <buffer>H     <Plug>(vimfiler_smart_h)
  autocmd FileType vimfiler nmap     <buffer><Right> <Plug>(vimfiler_smart_l)
  autocmd FileType vimfiler nmap     <buffer><C-r> <Plug>(vimfiler_redraw_screen)
  autocmd FileType vimfiler nmap     <buffer><cr> <Plug>(vimfiler_expand_or_edit)
  autocmd FileType vimfiler nmap     <buffer><BS> <Plug>(vimfiler_new_file) 
  autocmd FileType vimfiler nmap     <buffer>D  <Plug>(vimfiler_delete_file)
  autocmd FileType vimfiler nmap     <buffer><N>  <Plug>(vimfiler_make_directory)
  autocmd FileType vimfiler nmap     <buffer>u  <Plug>(vimfiler_toggle_mark_current_line)
  autocmd FileType vimfiler nnoremap <buffer>N     <S-N>
augroup END

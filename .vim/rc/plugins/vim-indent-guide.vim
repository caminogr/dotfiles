set tabstop=2 shiftwidth=2 expandtab

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size  = 2

augroup indent-color 
  autocmd!
  autocmd VimEnter,ColorScheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=236
  autocmd VimEnter,ColorScheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=235
augroup END

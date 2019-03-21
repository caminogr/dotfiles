let g:lightline = {
     \ 'colorscheme': 'Tomorrow_Night',
     \ 'active': {
     \   'right': [ [ 'lineinfo' ],
     \              [ 'percent' ],
     \              [ 'empty' ] ]
     \ },
     \ 'component_function': {
     \   'filename': 'LightlineFilename',
     \   'empty': 'Empty'
     \ }
     \ }
      " \   'paneinfo': 'PaneInfo',
      " \   'left':  [ ['paneinfo'] ],
" function! PaneInfo()
"   return %{winnr()}
" endfunction
"
function! Empty()
  return ""
endfunction

function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
       \ &filetype ==# 'unite' ? unite#get_status_string() :
       \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
       \ expand('%:p') !=# '' ? expand('%:p') : '[No Name]'
endfunction

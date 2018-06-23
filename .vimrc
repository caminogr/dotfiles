if &compatible
  set nocompatible
endif

augroup load_theme
  autocmd!
augroup END

"--------------------------------------------------------
"dein.vim
"--------------------------------------------------------

let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" get dein.vim if it doesn`t exist
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" setting for deinn
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif


" allow backspacing over everything in insert mode
set backspace=indent,eol,start


""""""""""""""""""""""""""""""""""""""
" mapping 
"""""""""""""""""""""""""""""""""""""""

let mapleader = "\<space>" 
nnoremap s <nop>
nnoremap o <nop>
nnoremap x <nop>
vnoremap U <nop>
vnoremap u <nop>
noremap  ; :
noremap  ' ;
vnoremap C U
vnoremap c u
noremap  <C-d> <Del>
noremap! <C-d> <Del>
noremap  <C-u> d0
inoremap <C-u> <C-o>d0
cnoremap <C-u> <C-w>
noremap  <C-k> D
inoremap <C-k> <C-o>D
noremap  <C-y> :q<CR>
nnoremap E :Explore<CR>
nnoremap VE :Vexplore<CR>

noremap <silent>ss :split<CR>
noremap <silent>sv :vsplit<CR>
noremap sh <C-w>h
noremap sl <C-w>l
noremap sk <C-w>k
noremap sj <C-w>j
noremap sH <C-w>H
noremap sL <C-w>L
noremap sK <C-w>K
noremap sJ <C-w>J


nnoremap s] <C-w>+
nnoremap s[ <C-w>-
nnoremap s0 <C-w>>
nnoremap s9 <C-w><
nnoremap = <C-w>10+
nnoremap - <C-w>10-
nnoremap 0 <C-w>10>
nnoremap 9 <C-w>10<

" yank

xnoremap p "_dP


" need to Refactor
noremap s1 :execute 1 . 'wincmd w'<cr>
noremap s2 :execute 2 . 'wincmd w'<cr>
noremap s3 :execute 3 . 'wincmd w'<cr>
noremap s4 :execute 4 . 'wincmd w'<cr>
noremap s5 :execute 5 . 'wincmd w'<cr>
noremap s6 :execute 6 . 'wincmd w'<cr>
noremap s7 :execute 7 . 'wincmd w'<cr>
noremap s8 :execute 8 . 'wincmd w'<cr>
" noremap s9 :execute 9 . 'wincmd w'<cr>
" win_gotoid(win_getid(${num}))


" === カーソル移動 ===
noremap  <C-a> 0
inoremap <C-a> <C-o>0
cnoremap <C-a> <C-b>
" nnoremap  <C-s> ^
" inoremap <C-s> ^
noremap  <C-e> $
inoremap <C-e> <C-o>$
noremap  m <C-d>
noremap  <S-m> <C-u>
noremap  <C-g> G 
noremap! <C-g> G
nnoremap <C-x> <C-o>

 
"--------------------------------------------------------
" keybind for insert new line
"--------------------------------------------------------
" binding CTRL+i to F12 by karabiner elements
noremap <F12> <C-i>
nnoremap <F12> o
nnoremap <C-o> O
inoremap <F12> <C-o>o
inoremap <C-o> <C-o>O

augroup autoCommentOff
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END

" === tab関連 ===

noremap <silent> tt    :tablast <bar> tabnew<CR>
noremap <silent> <D-w> :tabclose<CR>
noremap <silent> tn    :tabnext<CR>
noremap <silent> tp    :tabprevious<CR>


""""""""""""""""""""""""""""""""""""""
" 検索設定
""""""""""""""""""""""""""""""""""""""

" コマンド、検索パターンの履歴
set history=50		" keep 50 lines of command line history
" 検索の時に大文字と小文字を区別しない
set ignorecase
" インクリメントリサーチを使う 
set incsearch
set ruler		" show the cursor position all the time
autocmd QuickFixCmdPost *grep* cwindow
" ハイライトON
set hlsearch
" Esc でハイライトOFF
nnoremap <ESC><ESC> :noh<Return>
" カーソルが当たっている文字を検索
nnoremap <D-d> gd
syntax on


"--------------------------------------------------------
" setting for display 
"--------------------------------------------------------


" === window, buffer === 

" タイトルをウィンドウ枠に表示する
set title
set number
set splitbelow
set splitright
" always show netrw as tree.
" without this, file explore need to bdelete! to close
let g:netrw_liststyle=3

" === status line ===

"ステータス行を表示
set laststatus=2
" ステータスラインの色
" highlight statusline   term=NONE cterm=NONE guifg=red ctermfg=yellow ctermbg=red
"入力中のコマンドをステータスに表示する
set showcmd
set statusline=<%{winnr()}>\%f%r%h%w\%=[POS=%04v,%04l][%p%%]\ [LEN=%L]


" === text ===

noremap <TAB> >>
augroup reloadFileDiff
  autocmd!
  autocmd InsertEnter,WinEnter * checktime
augroup END

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\e]50;CursorShape=1\x7"
  let &t_EI = "\e]50;CursorShape=0\x7"
endif


" swapをファイル作らない
set noswapfile
" current pathを表示
noremap <D-1> :echo expand("%:p") <CR>
" current pathをコピー
noremap <D-2> :let @+ = expand("%:p") <CR>

"========================================================
" Setting for Plugin
"========================================================

"--------------------------------------------------------
" vimfiler
"--------------------------------------------------------

let g:vimfiler_as_default_explorer   = 1
let g:vimfiler_safe_mode_by_default  = 0
let g:vimfiler_ignore_pattern = '\%(.pyc\)$'
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'

noremap  <C-T> :VimFilerExplorer<cr>
nnoremap sn <C-w>t

autocmd FileType vimfiler nnoremap <buffer>h h
autocmd FileType vimfiler nnoremap <buffer>l l
autocmd FileType vimfiler nmap     <buffer>H     <Plug>(vimfiler_smart_h)
autocmd FileType vimfiler nmap     <buffer>L     <Plug>(vimfiler_smart_l)
autocmd FileType vimfiler nmap     <buffer><C-r> <Plug>(vimfiler_redraw_screen)
autocmd FileType vimfiler nmap     <buffer><BS>  <Plug>(vimfiler_new_file)
autocmd FileType vimfiler nnoremap <buffer>N     <S-N>


"--------------------------------------------------------
" neocomplete 
"--------------------------------------------------------

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplete.
let g:neocomplete#enable_at_startup  = 1
let g:neocomplete#enable_smart_case  = 1
let g:neocomplete#min_keyword_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-f> neocomplete#complete_common_string()

"--------------------------------------------------------
" neosnippet
"--------------------------------------------------------

let g:neosnippet#snippets_directory = '~/.vim/snippets/'
imap <C-s> <Plug>(neosnippet_expand_or_jump)
smap <C-s> <Plug>(neosnippet_expand_or_jump)
nmap <leader>s :NeoSnippetEdit<cr>

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

"--------------------------------------------------------
" lightline
"--------------------------------------------------------

let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              ['empty']]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'empty': 'Empty'
      \ }
      \ }
      
function! Empty()
  return ""
endfunction

function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:p') !=# '' ? expand('%:p') : '[No Name]'
endfunction

"--------------------------------------------------------
" auto-save 
"--------------------------------------------------------

let g:auto_save = 1
" disable in insert mode
let g:auto_save_in_insert_mode = 0


"--------------------------------------------------------
" caw.vim 
"--------------------------------------------------------
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)


"--------------------------------------------------------
" vim indent guildes
"--------------------------------------------------------
set tabstop=2 shiftwidth=2 expandtab

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size  = 2

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=235


"--------------------------------------------------------
" ctrlp 
"--------------------------------------------------------

nnoremap sm :<C-u>CtrlPMRUFiles<CR>
let g:ctrlp_user_command = 'ag %s -ig ""'


"--------------------------------------------------------
" fzf
"--------------------------------------------------------

set rtp+=/usr/local/opt/fzf
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fg :GFiles?<CR>
nnoremap <Leader>fr :Rg 
nnoremap <Leader>ft :Tags<CR>
nnoremap <Leader>fm :FZFMru<CR>

" preview file with :Files
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})

run ripgrep with :Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('right:50%:hidden', '?')
  \           : fzf#vim#with_preview('up:60%'),
  \   <bang>0)


"--------------------------------------------------------
" ctags
"--------------------------------------------------------

" tagsジャンプの時に複数ある時は一覧表示                                        
nnoremap <C-]> g<C-]>


"--------------------------------------------------------
" Tagbar"
"--------------------------------------------------------

nnoremap <silent><Leader>b :TagbarToggle<CR>

" vim-closetag
"--------------------------------------------------------
let g:closetag_emptyTags_caseSensitive = 1

" サポートするファイル 
let g:closetag_filenames = "*.html, *.xhtml, *.phtml, *.jsx"



"--------------------------------------------------------
" emmet-vim
"--------------------------------------------------------

let g:user_emmet_install_global = 0

autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<c-f>'
let g:user_emmet_expandabbr_key="'"

"--------------------------------------------------------


"--------------------------------------------------------
"--------------------------------------------------------


"--------------------------------------------------------
" vim-javascript
"--------------------------------------------------------
let g:javascript_plugin_flow = 1

"--------------------------------------------------------
" ALE
"--------------------------------------------------------
noremap <leader>p :ALEFix<CR>

let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier'],
\}
let g:ale_linters = {
\  'javascript': ['stylelint', 'eslint', 'prettier', 'flow'],
\}
let g:ale_linter_aliases = {'javascript': ['javascript', 'css']}
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '?'
" let g:ale_set_signs = 0
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_echo_msg_format = '%linter%: %s'
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>


"""""""""""""""""""""""""""""""""""""
" コピペ
"""""""""""""""""""""""""""""""""""""

" クリップボード連携
set clipboard=unnamed,autoselect


""""""""""""""""""""""""""""""""""""""
" バックアップ
""""""""""""""""""""""""""""""""""""""

" ファイルのバックアップを有効にする
set backup
" 取得するバックアップを編集前のファイルとする(無効化する場合は「nowritebackup」)
set writebackup
" バックアップ先のディレクトリ指定
set backupdir=$HOME/.vimbackup




" prompt
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif


"--------------------------------------------------------
" Color & Highlight
"--------------------------------------------------------

augroup golangSettings
  autocmd!
  autocmd ColorScheme * highlight LineNr guifg=#767676 ctermfg=244
  autocmd ColorScheme * highlight Visual guifg=#4D5056 guibg=#C5C4BD
  autocmd ColorScheme * highlight Search cterm=bold ctermfg=0 ctermbg=7 gui=bold guifg=Black guibg=LightGrey

  autocmd colorscheme * highlight ideographicspace term=underline ctermbg=darkgreen guibg=darkgreen
  autocmd vimenter,winenter * match ideographicspace /　/
augroup END

if has("autocmd")
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


function! ReadJSFile() abort
  let s:currentPos = col('.')
  let s:colNum = s:currentPos - 1
  let s:lastPos = len(getline('.'))
  let s:fileName = ''

  while s:colNum > -1
    if getline('.')[s:colNum] =~ "\['\"\]"
      break
    end
    let s:fileName =  getline('.')[s:colNum] . s:fileName
    let s:colNum = s:colNum - 1
  endwhile
  while s:currentPos < s:lastPos
    if getline('.')[s:currentPos] =~ "\['\"\]"
      break
    end
    let s:fileName =  s:fileName . getline('.')[s:currentPos]
    let s:currentPos = s:currentPos + 1
  endwhile
  let s:fullName = simplify(expand("%:h") . '/' . s:fileName)
  if !filereadable(s:fullName)
    if isdirectory(s:fullName)
      let s:fullName = s:fullName . '/index.js'
    else
      let s:fullName = simplify(glob("*/src/") . s:fileName) . '.js'
    endif
  endif
  execute ':e ' . s:fullName
endfunction
autocmd FileType javascript nmap gf :call ReadJSFile()<CR>

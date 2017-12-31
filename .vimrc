if &compatible
    set nocompatible
endif


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


 " """"""""""""""""""""""""""""""""""""""
 " " NeoBundle
 " """""""""""""""""""""""""""""""""""""""
 " if has('vim_starting')
 "   "初回起動時のみruntimepathにneobundleのパスを指定する
 "   set runtimepath+=~/.vim/bundle/neobundle.vim/
 " endif
 "
 " " === Init Neobundle ===
 " call neobundle#begin(expand('~/.vim/bundle/'))
 " NeoBundleFetch 'Shougo/neobundle.vim'
 " " NeoBundle 'scrooloose/nerdtree'
 " " NeoBundle 'vim-scripts/vim-auto-save'
 " NeoBundle 'rking/ag.vim'
 " " NeoBundle 'ctrlpvim/ctrlp.vim'
 " " NeoBundle 'tyru/caw.vim.git'
 " " NeoBundle 'nathanaelkane/vim-indent-guides'
 " " NeoBundle 'tpope/vim-fugitive'
 " NeoBundle 'alvan/vim-closetag'
 " NeoBundle 'fatih/vim-go'
 "
 "
 "
 " " highlight
 " " NeoBundle 'othree/html5.vim'
 " NeoBundle 'tpope/vim-haml'
 " NeoBundle 'slim-template/vim-slim'
 " NeoBundle 'kchmck/vim-coffee-script'
 " NeoBundle 'digitaltoad/vim-pug'
 " NeoBundle 'pangloss/vim-javascript'
 " NeoBundle 'mxw/vim-jsx'
 " NeoBundle 'fleischie/vim-styled-components'
 "
 "
 " " complement
 "
 " call neobundle#end()
 " NeoBundleCheck



" allow backspacing over everything in insert mode
set backspace=indent,eol,start




""""""""""""""""""""""""""""""""""""""
" mapping 
"""""""""""""""""""""""""""""""""""""""

let mapleader = "\<space>" 
nnoremap s <nop>
nnoremap o <nop>
nnoremap . <nop>
nnoremap x <nop>
vnoremap U <nop>
vnoremap u <nop>
noremap  ; :
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
nnoremap <C-i> o

noremap <silent>ss :split<CR>
noremap <silent>sv :vsplit<CR>
noremap sh <C-w>h
noremap sl <C-w>l
noremap sk <C-w>k
noremap sj <C-w>j
noremap s; <C-w>+
noremap s- <C-w>-
noremap s. <C-w>>
noremap s, <C-w><

" need to Refactor
noremap s1 :execute 1 . 'wincmd w'<cr>
noremap s2 :execute 2 . 'wincmd w'<cr>
noremap s3 :execute 3 . 'wincmd w'<cr>
noremap s4 :execute 4 . 'wincmd w'<cr>
noremap s5 :execute 5 . 'wincmd w'<cr>
noremap s6 :execute 6 . 'wincmd w'<cr>
noremap s7 :execute 7 . 'wincmd w'<cr>
noremap s8 :execute 8 . 'wincmd w'<cr>
noremap s9 :execute 9 . 'wincmd w'<cr>
" win_gotoid(win_getid(${num}))


" === カーソル移動 ===

noremap  <C-a> 0
inoremap <C-a> <C-o>0
cnoremap <C-a> <C-b>
noremap  <C-s> ^
inoremap <C-s> ^
noremap  <C-e> $
inoremap <C-e> <C-o>$
noremap  m <C-d>
noremap  <S-m> <C-u>
noremap  f w
noremap  <C-g> G 
noremap! <C-g> G

" === tab関連 ===

noremap <silent> tt    :tablast <bar> tabnew<CR>
noremap <silent> <D-w> :tabclose<CR>
noremap <silent> tn    :tabnext<CR>
noremap <silent> tp    :tabprevious<CR>


""""""""""""""""""""""""""""""""""""""
" 検索設定
""""""""""""""""""""""""""""""""""""""

" 外部grepにhighwayを指定
set grepprg=hw
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


""""""""""""""""""""""""""""""""""""""
" 表示設定
""""""""""""""""""""""""""""""""""""""

" タイトルをウィンドウ枠に表示する
set title
" 行番号を表示
set number
" 新しいウィンドウを下に開く
set splitbelow
" 新しいウィンドウを右に開く
set splitright

" 全角スペースを可視化
augroup highlightidegraphicspace
  autocmd!
  autocmd colorscheme * highlight ideographicspace term=underline ctermbg=darkgreen guibg=darkgreen
  autocmd vimenter,winenter * match ideographicspace /　/
augroup end

" === status line ===

"ステータス行を表示
set laststatus=2
" ステータスラインの色
" highlight statusline   term=NONE cterm=NONE guifg=red ctermfg=yellow ctermbg=red
"入力中のコマンドをステータスに表示する
set showcmd
set statusline=<%{winnr()}>\%f%r%h%w\%=[POS=%04v,%04l][%p%%]\ [LEN=%L]


" === ファイルに関する設定 ===

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
noremap <C-T> :VimFilerExplorer<cr>
nnoremap sn <C-w>t

set splitright


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
" ctags
"--------------------------------------------------------

" tagsジャンプの時に複数ある時は一覧表示                                        
nnoremap <C-]> g<C-]>


"--------------------------------------------------------
" vim-closetag
"--------------------------------------------------------
let g:closetag_emptyTags_caseSensitive = 1

" サポートするファイル 
let g:closetag_filenames = "*.html, *.xhtml, *.phtml, *.jsx"







""""""""""""""""""""""""""""""""""""""
" Register filetype or syntax
""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.html setf html
autocmd BufNewFile,BufRead *.erb setf eruby.html
autocmd BufNewFile,BufRead *.haml setf haml
autocmd BufNewFile,BufRead *.slim setf slim
autocmd BufNewFile,BufRead *.scss setf scss
autocmd BufNewFile,BufRead *.js setf javascript
autocmd BufNewFile,BufRead *.jsx setf javascript.jsx
autocmd BufNewFile,BufRead *.coffee setf coffee
autocmd BufNewFile,BufRead *.jade setf jade
autocmd BufNewFile,BufRead *.md setf markdown
autocmd BufNewFile,BufRead *.yml setf yaml

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

" 行数の色設定
autocmd ColorScheme * highlight LineNr guifg=#767676 ctermfg=244


" visualモードの背景の設定
autocmd ColorScheme * highlight Visual guifg=#4D5056 guibg=#C5C4BD

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  colorscheme Tomorrow-Night
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
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

""""""""""""""""""""""""""""""""""""""
" NeoBundle
"""""""""""""""""""""""""""""""""""""""

set nocompatible
if has('vim_starting')
  "初回起動時のみruntimepathにneobundleのパスを指定する
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" === Init Neobundle ===
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle "vim-scripts/vim-auto-save"
NeoBundle 'rking/ag.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'tyru/caw.vim.git'
NeoBundle 'nathanaelkane/vim-indent-guides'

" highlight
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'tpope/vim-haml'
NeoBundle 'slim-template/vim-slim'
 
 

call neobundle#end()
NeoBundleCheck




" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start




""""""""""""""""""""""""""""""""""""""
" マッピング
"""""""""""""""""""""""""""""""""""""""

"リーダーキーをスペースにマッピング
let mapleader = "\<space>" 
" キーを無効化
nnoremap s <nop>
nnoremap o <nop>
" neobundleinstall
cnoremap NBI NeoBundleInstall
" ;を:にマッピング
noremap ; :
" 行頭に移動
noremap  <C-a> 0
noremap! <C-a> <C-o>0
" 行末に移動
noremap  <C-e> $
noremap! <C-e> <C-o>$
" カーソル前の文字削除
noremap  <C-h> <S-x>
inoremap <C-h> <C-g>u<C-h>
" カーソル後の文字削除
noremap  <C-d> <Del>
inoremap <C-d> <Del>
" 行頭からカーソルまで削除
noremap  <C-u> d0
inoremap <C-u> <C-o>d0
" カーソルから行末まで削除
noremap  <C-k> D
inoremap <C-k> <C-o>D
" ファイルの変更を保存しないで終了する
noremap <C-y> :q<CR>
" 水平分割
noremap ss :split<CR>
" 垂直分割
noremap sv :vsplit<CR>
" 左に移動
noremap sh <C-w>h
" 右に移動
noremap sl <C-w>l
" 上に移動
noremap sk <C-w>k
" 下に移動
noremap sj <C-w>j
"高さを増やす
noremap s; <C-w>+
"高さを減らす
noremap s- <C-w>-
" 幅を増やす
noremap s. <C-w>>
" 幅を減らす
noremap s, <C-w><

"----------------------------------------------------
" 検索設定
"----------------------------------------------------
" コマンド、検索パターンの履歴
set history=50		" keep 50 lines of command line history
" 検索の時に大文字と小文字を区別しない
set ignorecase
" インクリメントリサーチを使う 
set incsearch
set ruler		" show the cursor position all the time

"----------------------------------------------------
" 表示設定
"----------------------------------------------------
" タイトルをウィンドウ枠に表示する
set title
" 行番号を表示
set number
"入力中のコマンドをステータスに表示する
set showcmd
" インデントをスペース２つ分にする
set tabstop=2
" tabを半角スペースで挿入する
set expandtab
" 新しいウィンドウを下に開く
set splitbelow
" 新しいウィンドウを右に開く
set splitright


" === nerdtree ===

nnoremap <silent><C-n> :NERDTreeToggle<CR>
" ファイルを指定せずにvimを起動した時にnerdtreeを開く
autocmd vimenter * if !argc() | NERDTree | endif
""""""""""""""""""""""""""""""""""""""
" Neo Bundle Plugin
""""""""""""""""""""""""""""""""""""""

" === nerdtree ===
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
" デフォルトでツリーを表示させる
autocmd vimenter * if !argc() | NERDTree | endif
" ブックマークを初期表示
let g:NERDTreeShowBookmarks=1
" nerdtreeを開くためのキーマッピング
nnoremap <silent><C-n> :NERDTreeToggle<cr>


" === auto-save ===

" デフォルトで有効にする
let g:auto_save = 1
" インサートモード時は保存しない
let g:auto_save_in_insert_mode = 0

" === caw.vim ===
" コメントアウト機能
nmap <leader>c <plug>(caw:i:toggle)
vmap <leader>c <plug>(caw:i:toggle)

" === vim-indent-guides ===
let g:indent_guides_enable_on_vim_startup = 1
set tabstop=2 shiftwidth=2 expandtab
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#444433 ctermbg=black 
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray 



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

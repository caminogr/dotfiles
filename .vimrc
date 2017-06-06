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
NeoBundle 'vim-scripts/vim-auto-save'
NeoBundle 'rking/ag.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'tyru/caw.vim.git'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'alvan/vim-closetag'



" highlight
NeoBundle 'othree/html5.vim'
NeoBundle 'tpope/vim-haml'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'digitaltoad/vim-pug'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'


" complement 
NeoBundle 'kana/vim-smartinput'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'Shougo/neocomplcache'

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
" mapping 
"""""""""""""""""""""""""""""""""""""""

"リーダーキーをスペースにマッピング
let mapleader = "\<space>" 
" キーを無効化
nnoremap s <nop>
nnoremap o <nop>
" neobundleinstall
cnoremap NBI NeoBundleInstall
" binding.pry
inoremap <C-b> binding.pry
" console.log();
inoremap <C-c> console.log();
" ;を:にマッピング
noremap ; :
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
" control + i で下の行でinsert
nnoremap <C-i> o
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

" === カーソル移動 ===
 
 " 行頭に移動
noremap  <C-a> 0
inoremap <C-a> <C-o>0
" 行末に移動
noremap  <C-e> $
inoremap <C-e> <C-o>$
" 半画面下にスクロール
noremap m <C-d>
" 半画面上にスクロール
noremap <S-m> <C-u>
noremap <S-m> <C-u>
" 次の単語の前に移動
noremap f w

" === tab関連 ===

" tc 新しいタブを作る
noremap <silent> tt :tablast <bar> tabnew<CR>
" tx タブを閉じる
noremap <silent> <D-w> :tabclose<CR>
" tn 次のタブ
noremap <silent> tn :tabnext<CR>
" tp 前のタブ
noremap <silent> tp :tabprevious<CR>


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
nnoremap <silent><Esc> :noh<Return>


""""""""""""""""""""""""""""""""""""""
" 表示設定
""""""""""""""""""""""""""""""""""""""

" タイトルをウィンドウ枠に表示する
set title
" 行番号を表示
set number
" インデントをスペース２つ分にする
set tabstop=2
" tabを半角スペースで挿入する
set expandtab
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
set statusline=%f%r%h%w\%=[POS=%04v,%04l][%p%%]\ [LEN=%L]


" === ファイルに関する設定 ===

" swapをファイル作らない
set noswapfile
" current pathを表示
noremap <D-1> :echo expand("%:p") <CR>
" current pathをコピー
noremap <D-2> :let @+ = expand("%:p") <CR>


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
nnoremap <silent><C-t> :NERDTreeToggle<cr>


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


" === ctrlp-vim ===

" これまで開いたファイル履歴から絞り込む
nnoremap sm :<C-u>CtrlPMRUFiles<CR>
let g:ctrlp_user_command = 'ag %s -ig ""'


" === ctags ===

" tagsジャンプの時に複数ある時は一覧表示                                        
nnoremap <C-]> g<C-]>

" === vim-closetag ===
"
let g:closetag_emptyTags_caseSensitive = 1

" サポートするファイル 
let g:closetag_filenames = "*.html, *.xhtml, *.phtml, *.jsx"


" === neocomplcache ===
"
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()




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


" fontの指定
if has('mac') && has('gui_running')
  set macligatures
  set guifont=Fira\ Code:h12
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

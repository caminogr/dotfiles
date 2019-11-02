scriptencoding utf-8

let mapleader = "\<space>" 
let g:python_host_prog = expand('~/.pyenv/shims/python')
let g:python3_host_prog = expand('~/.pyenv/shims/python3')

source ~/.vim/rc/plugins/dein.vim

runtime macros/matchit.vim

source ~/.vim/rc/plugins/ale.vim
source ~/.vim/rc/plugins/auto-save.vim
source ~/.vim/rc/plugins/emmet-vim.vim
source ~/.vim/rc/plugins/filer.vim
source ~/.vim/rc/plugins/fzf.vim
source ~/.vim/rc/plugins/lightline.vim
source ~/.vim/rc/plugins/nerdcommenter.vim
source ~/.vim/rc/plugins/neosnippet.vim
source ~/.vim/rc/plugins/sonictemplate-vim.vim
source ~/.vim/rc/plugins/vim-easymotion.vim
source ~/.vim/rc/plugins/vim-closetag.vim
source ~/.vim/rc/plugins/vim-indent-guide.vim
source ~/.vim/rc/plugins/vim-lsp.vim
source ~/.vim/rc/plugins/vim-javascript.vim
source ~/.vim/rc/plugins/vim-precious.vim
source ~/.vim/rc/plugins/vim-precious.vim
source ~/.vim/rc/set.vim

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf_openframeworks.py'

filetype plugin indent on
syntax enable


""""""""""""""""""""""""""""""""""""""
" mapping 
"""""""""""""""""""""""""""""""""""""""

nnoremap s <nop>
" nnoremap o <nop>
nnoremap x <nop>
vnoremap U <nop>
vnoremap u <nop>
vnoremap x <nop>
noremap  ; :
noremap  ' ;
vnoremap C U
vnoremap c u
noremap  <C-s> <C-d>
noremap  <C-d> <DEL>
noremap! <C-d> <DEL>
nnoremap DD "_dd
nnoremap D "_d
" delete line except indetataion
inoremap <C-U> <C-G>u<C-U>
" noremap  <C-u> d0
inoremap <C-u> <C-o>d0
cnoremap <C-u> <C-w>
noremap  <C-k> D
inoremap <C-k> <C-o>D
noremap  <C-y> :q<CR>
nnoremap <C-C> :e %:h<CR>
nnoremap  <C-g> <C-e>
nnoremap  <C-m> <C-y>

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


" nnoremap s] <C-w>+
" nnoremap s[ <C-w>-
" nnoremap s0 <C-w>>
" nnoremap s9 <C-w><
nnoremap = <C-w>10+
nnoremap - <C-w>10-
nnoremap + <C-w>10>
nnoremap _ <C-w>10<

" yank
 
xnoremap p "_dP
nnoremap [p :pu<CR>
nnoremap [P :pu!<CR>


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
noremap  <C-e> $
inoremap <C-e> <C-o>$
" noremap  m <C-d>
" noremap  <S-m> <C-u>
" noremap  <C-g> G
" noremap! <C-g> G
nnoremap <C-x> <C-o>
map x %

" Terminal mode
nnoremap T :tabe<CR>:terminal<CR>
tnoremap <silent> <ESC> <C-\><C-n>
tnoremap <silent> <ESC> <C-\><C-n>
tnoremap <silent> <C-h> <nop>
tnoremap <silent> <C-j> <nop>
tnoremap <silent> <C-k> <nop>
tnoremap <silent> <C-l> <nop>


"--------------------------------------------------------
" keybind for insert new line
"--------------------------------------------------------
" binding CTRL+i to F12 by karabiner elements
noremap <F12> <C-i>
nnoremap <F12> o
nnoremap <C-o> O
inoremap <F12> <C-o>o
inoremap <C-o> <C-o>O


" === tab関連 ===

noremap <silent> tt    :tablast <bar> tabnew<CR>
noremap <silent> <D-w> :tabclose<CR>
noremap <silent> tn    :tabnext<CR>
noremap <silent> tp    :tabprevious<CR>


""""""""""""""""""""""""""""""""""""""
" 検索設定
""""""""""""""""""""""""""""""""""""""

nnoremap <silent><ESC><ESC> :noh<Return>


" nnoremap <silent> <leader>g :<C-u>Unite grep:. -resume -buffer-name=search-buffer<CR>
" nnoremap <silent> <leader>g :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
if executable('rg')
  let g:unite_source_grep_command = 'rg'
  let g:unite_source_grep_default_opts = '--no-heading --hidden'
           \ " --ignore-file='*.log'"
           \ " --ignore-file='*.idea*'"
  let g:unite_source_grep_recursive_opt = ''
endif



" === text ===

vnoremap <TAB> >gv
vnoremap <S-TAB> <gv
nnoremap <TAB> >>
nnoremap <S-TAB> <<

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\e]50;CursorShape=1\x7"
  let &t_EI = "\e]50;CursorShape=0\x7"
endif


" Show current path
noremap >1 :echo expand("%:p") <CR>
" Copy current path
noremap >2 :let @+ = expand("%:p") <CR>



"--------------------------------------------------------
" setting for markdown
"--------------------------------------------------------

nnoremap <Leader>mp :Typora<CR>
if has('mac')
  function! OpenTypora()
      " Launch Typora
      call system("open -a Typora \"" . expand("%") . "\"")
      setlocal autoread
  endfunction

  command! Typora call OpenTypora()
endif





" prompt
" For Win31 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
" map Q gq


" In many terminal emulators the mouse works just fine, thus enable it.


"--------------------------------------------------------
" Color & Highlight
"--------------------------------------------------------

" augroup color-and-highlight
  " autocmd!
  " autocmd ColorScheme * highlight LineNr ctermfg=244
  " autocmd ColorScheme * highlight Search ctermfg=238 ctermbg=231
  " autocmd ColorScheme * highlight ideographicSpace term=underline ctermbg=darkgreen
  " autocmd vimenter,winenter * match ideographicSpace /　/
" augroup END


" if has("autocmd")
"   filetype plugin indent on
"
"   " Put these in an autocmd group, so that we can delete them easily.
"   augroup vimrcEx
"   au!
"
"   " For all text files set 'textwidth' to 77 characters.
"   autocmd FileType text setlocal textwidth=77
"
"   " When editing a file, always jump to the last known cursor position.
"   " Don't do it when the position is invalid or when inside an event handler
"   " (happens when dropping a file on gvim).
"   " Also don't do it when the mark is in the first line, that is the default
"   " position when opening a file.
"   autocmd BufReadPost *
"   \ if line("'\"") > 0 && line("'\"") <= line("$") |
"   \   exe "normal! g`\"" |
"   \ endif
"
"   augroup END
"
" else
"
" endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" if !exists(":DiffOrig")
"   command DiffOrig vert new | set bt=nofile | r # | -1d_ | diffthis
" 	  \ | wincmd p | diffthis
" endif
  


" In the quickfix window, <CR> is used to jump to the error under the cursor,
" so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>


" Comment out if you want to get log
" set verbosefile=~/VimRuntimeDebugging.log
" set verbose=2

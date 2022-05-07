scriptencoding utf-8

let mapleader = "\<space>" 

let g:python_host_prog = expand('~/.pyenv/shims/python')
let g:python3_host_prog = expand('~/.pyenv/shims/python3')

source ~/.vim/rc/plugins/dein.vim

runtime macros/matchit.vim

" source ~/.vim/rc/plugins/filer.vim
source ~/.vim/rc/plugins/fzf.vim
" source ~/.vim/rc/plugins/nerdcommenter.vim
source ~/.vim/rc/plugins/sonictemplate-vim.vim
source ~/.vim/rc/plugins/vim-easymotion.vim
source ~/.vim/rc/plugins/vim-closetag.vim
source ~/.vim/rc/plugins/vim-indent-guide.vim
" source ~/.vim/rc/plugins/vim-lsp.vim
" source ~/.vim/rc/plugins/vim-javascript.vim
" source ~/.vim/rc/plugins/vim-precious.vim
" source ~/.vim/rc/plugins/vim-quickrun.vim
source ~/.vim/rc/set.vim

filetype plugin indent on
syntax enable

" mapping 
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
" nnoremap DD "_dd
" nnoremap D "_d
" delete line except indetataion
inoremap <C-U> <C-G>u<C-U>


" noremap  <C-u> d0
inoremap <C-u> <C-o>d0
cnoremap <C-u> <C-w>
noremap  <C-k> D
inoremap <C-k> <C-o>D
noremap  sw :w<CR>
noremap  sq :wq<CR>
noremap  <C-y> :q<CR>
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

nnoremap = <C-w>10+
nnoremap - <C-w>10-
nnoremap + <C-w>10>
nnoremap _ <C-w>10<

" display lines downward.
nmap gj gj<SID>g
nmap gk gk<SID>g
nnoremap <script> <SID>gj gj<SID>g
nnoremap <script> <SID>gk gk<SID>g
nmap <SID>g <Nop>


" yank
xnoremap p "_dP
nnoremap [p :pu<CR>
nnoremap [P :pu!<CR>
nnoremap p ]p
nnoremap P ]P

" motion.
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


" inserting
" binding CTRL+i to F12 by karabiner elements
noremap <F12> <C-i>
nnoremap <F12> o
" nnoremap <C-o> O
inoremap <F12> <C-o>o
" inoremap <C-o> <C-o>O

" tab
noremap <silent> tt    :tablast <bar> tabnew<CR>
noremap <silent> <D-w> :tabclose<CR>
noremap <silent> tn    :tabnext<CR>
noremap <silent> tp    :tabprevious<CR>

" search
nnoremap <silent><ESC><ESC> :noh<Return>

" grep
if executable('rg')
  let g:unite_source_grep_command = 'rg'
  let g:unite_source_grep_default_opts = '--no-heading --hidden'
           \ " --ignore-file='*.log'"
           \ " --ignore-file='*.idea*'"
  let g:unite_source_grep_recursive_opt = ''
endif


" Show current path
noremap >1 :echo expand("%:p") <CR>
" Copy current path
noremap >2 :let @+ = expand("%:p") <CR>

" Don't use Ex mode, use Q for formatting
map Q gq


" markdown
nnoremap <Leader>mp :Typora<CR>
if has('mac')
  function! OpenTypora()
      " Launch Typora
      call system("open -a Typora \"" . expand("%") . "\"")
      setlocal autoread
  endfunction

  command! Typora call OpenTypora()
endif




" In the quickfix window, <CR> is used to jump to the error under the cursor,
" so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.vs,*.fs,*.vert,*.frag set ft=glsl

" tmux
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\e]50;CursorShape=1\x7"
  let &t_EI = "\e]50;CursorShape=0\x7"
endif


" Comment out if you want to get log
" set verbosefile=~/VimRuntimeDebugging.log
" set verbose=2

" if &compatible
"   set nocompatible
" endif
" 
" " Install dein
" set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
" 
" if dein#load_state('~/.cache/dein')
"   call dein#begin('~/.cache/dein')
" 
"   call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
"   call dein#add('Shougo/deoplete.nvim')
" 
"   call dein#end()
"   call dein#save_state()
" endif
" 
" " if dein#check_install()
" "	call dein#install()
" " endif
" 
" filetype plugin indent on
" syntax enable
" 
" 
" " # plugin
" 
" " ## deoplete
" let g:deoplete#enable_at_startup = 1
"


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif
 
" Required:
set runtimepath+=/Users/adachin/.cache/dein/repos/github.com/Shougo/dein.vim
 
" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
 
  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/.cache/dein/repos/github.com/Shougo/dein.vim')
 
  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
 
  " You can specify revision/branch/tag.
  " call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })
 
  " Required:
  call dein#end()
  call dein#save_state()
endif
 
" Required:
filetype plugin indent on
syntax enable
 
" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

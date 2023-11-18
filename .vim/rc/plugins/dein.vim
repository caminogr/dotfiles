let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let g:dein#install_github_api_token = $GITHUB_TOKEN
let g:dein#cache_directory = $HOME . s:dein_dir . '/.cache'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

if dein#min#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  let s:ddc_toml = g:rc_dir . '/ddc.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#load_toml(s:ddc_toml, {'lazy': 1})

  call dein#add('williamboman/mason.nvim',#{
    \ lazy: 1,
    \ on_event: 'VimEnter',
    \ hook_source: 'luafile ~/.vim/rc/plugins/lua/mason.lua'
  \}) " lsp installer

  call dein#add('neovim/nvim-lspconfig', #{
    \lazy: 1,
    \depends: ['mason.nvim'],
    \on_event: 'VimEnter',
    \hook_source: 'luafile ~/.vim/rc/plugins/lua/nvim-lspconfig.lua'
    \}) " language server protocol

  call dein#add('williamboman/mason-lspconfig.nvim',#{
    \ lazy: 1,
    \ depends: ['mason.nvim'],
    \ on_event: 'VimEnter'
    \}) " lsp setting

  call dein#add('jose-elias-alvarez/null-ls.nvim',#{
    \ lazy: 1,
    \ depends: ['mason.nvim'],
    \ on_event: 'VimEnter',
    \hook_source: 'luafile ~/.vim/rc/plugins/lua/null-ls.lua'
   \}) " linter and formatter

   call dein#add('nvim-treesitter/nvim-treesitter',#{
     \ lazy: 1,
     \ on_event: 'VimEnter',
     \ hook_done_update: ":TSUpdate",
     \ hook_source: 'luafile ~/.vim/rc/plugins/lua/nvim-treesitter.lua'
    \}) "  easy way to use the interface of tree-sitter

   call dein#add('HiPhish/rainbow-delimiters.nvim',#{
     \ lazy: 1,
     \ depends: ['nvim-treesitter'],
     \ on_event: 'VimEnter',
    \}) " rainbow parentheses 

    call dein#add('andymass/vim-matchup',#{
      \ lazy: 1,
      \depends: ['nvim-treesitter'],
      \ on_event: 'VimEnter',
     \}) " move cursor parentheses 

    call dein#add('JoosepAlviste/nvim-ts-context-commentstring',#{
      \ lazy: 1,
      \ depends: ['nvim-treesitter'],
      \ on_event: 'VimEnter',
     \}) " improve comment

     call dein#add('haringsrob/nvim_context_vt',#{
       \ lazy: 1,
       \ depends: ['nvim-treesitter'],
       \ on_event: "VimEnter",
       \ hook_post_source: 'luafile ~/.vim/rc/plugins/lua/nvim_context_vt.lua'
      \}) " show virtual text after close parentheses

      call dein#add('nvim-treesitter/nvim-treesitter-context',#{
        \ depends: ['nvim-treesitter'],
        \ lazy: 1,
        \ on_event: "VimEnter",
        \ hook_post_source: 'luafile ~/.vim/rc/plugins/lua/nvim-treesitter-context.lua'
       \}) " move cursor parentheses 

    call dein#add('m-demare/hlargs.nvim',#{
      \ depends: ['nvim-treesitter'],
      \ lazy: 1,
      \ on_event: "VimEnter",
      \ hook_source: 'luafile ~/.vim/rc/plugins/lua/hlargs.lua'
     \}) " move cursor parentheses 


    call dein#add('jackMort/ChatGPT.nvim',#{
      \ depends: ['nui.nvim', 'plenary.nvim', 'telescope.nvim'],
      \ lazy: 1,
      \ on_event: "VimEnter",
      \ hook_source: 'luafile ~/.vim/rc/plugins/lua/chatgpt.lua'
     \}) " chatgpt

    call dein#add('MunifTanjim/nui.nvim',#{
      \ lazy: 1,
      \ on_event: "VimEnter",
     \}) " ui component (installed for chatgpt)
    call dein#add('nvim-lua/plenary.nvim',#{
      \ lazy: 1,
      \ on_event: "VimEnter",
     \}) " improve job
    call dein#add('nvim-telescope/telescope.nvim',#{
      \ lazy: 1,
      \ on_event: "VimEnter",
     \})

     call dein#add('github/copilot.vim',#{
       \ lazy: 1,
       \ on_event: "VimEnter",
       \ hook_source: 'luafile ~/.vim/rc/plugins/lua/copilot.lua'
      \}) "use copilot
  
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
 call dein#install()
endif

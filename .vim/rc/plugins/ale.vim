noremap <buffer><leader>p :ALEFix<CR>
nnoremap <buffer><leader>an :ALENextWrap<cr>
nnoremap <buffer><leader>ap :ALEPreviousWrap<cr>

let g:ale_fixers = {
\  'vue': ['eslint', 'prettier'],
\  'javascript': ['eslint', 'prettier'],
\  'typescript': ['eslint', 'prettier'],
\  'python': ['autopep8', 'black', 'isort'],
\ 'cpp': ['clang-format'],
\  }

let g:ale_linters = {
\  'vim': ['vint'],
\  'javascript': ['stylelint', 'eslint', 'prettier'],
\  'typescript': ['eslint', 'prettier', 'tsserver', 'typecheck'],
\  'vue': ['eslint', 'prettier'],
\  'python': ['flake8'],
\ 'cpp': ['clang-format'],
\ }

let g:ale_fix_on_save = 1
let g:ale_linter_aliases = {'javascript': ['javascript', 'css'], 'vue': ['javascript', 'typescript']}
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_set_highlights = 0
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '?'

highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_echo_msg_format = '%linter%: %s'

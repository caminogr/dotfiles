noremap <leader>p :ALEFix<CR>

" \  'javascript': ['eslint', 'prettier'],
" \  'typescript': ['eslint', 'tslint', 'prettier'],
let g:ale_fixers = {
\  'javascript': ['eslint'],
\  'typescript': ['eslint', 'tslint'],
\  'vue': ['eslint', 'prettier'],
\ 'cpp': ['clang-format'],
\  }

let g:ale_linters = {
\  'vim': ['vint'],
\  'javascript': ['stylelint', 'eslint', 'flow'],
\  'typescript': ['eslint', 'tslint', 'tsserver', 'typecheck'],
\  'vue': ['eslint'],
\ 'cpp': ['clang-format'],
\ }

" let g:ale_pattern_options_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_linter_aliases = {'javascript': ['javascript', 'css'], 'vue': ['javascript', 'typescript']}
" let g:ale_javascript_prettier_use_local_config = 1
let g:ale_set_highlights = 0
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '?'
" let g:ale_set_signs = 0

highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_echo_msg_format = '%linter%: %s'
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>


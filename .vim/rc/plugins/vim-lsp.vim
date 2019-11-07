nmap <silent> <Leader>ld :LspDefinition<CR>
nmap <silent> <Leader>lh :LspHover<CR>
nmap <silent> <Leader>lr :LspReferences<CR>
nmap <silent> <Leader>li :LspImplementation<CR>
nmap <silent> <Leader>ls :split \| :LspDefinition <CR>
nmap <silent> <Leader>lv :vsplit \| :LspDefinition <CR>

let g:lsp_async_completion = 1
" lint機能をoff
" let g:lsp_diagnostics_enabled = 0

let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}


" for debug
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
" let g:asyncomplete_log_file = expand('~/asyncomplete.log')

" let g:clang_cpp_options = '-std=c++11'

" cpp
if executable('cquery')
  augroup LspCpp
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'cquery',
        \ 'cmd': {server_info->['cquery']},
        \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
        \ 'initialization_options': { 'cacheDirectory': '/tmp/cquery/cache' },
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
        \ })
  augroup end
endif

" typescript
if executable('typescript-language-server')
  augroup LspTypeScript
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescript.tsx'],
        \ })
  augroup end
endif

" vue
if executable('vls')
  augroup LspVls
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'vue-language-server',
        \ 'cmd': {server_info->['vls']},
        \ 'whitelist': ['vue'],
        \ 'initialization_options': {
        \         'config': {
        \             'html': {},
        \              'vetur': {
        \                  'validation': {}
        \              }
        \         }
        \     }
        \ })

    autocmd FileType vue setlocal omnifunc=lsp#complete
  augroup end
endif

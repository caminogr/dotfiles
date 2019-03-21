augroup golangSettings
  autocmd!
  autocmd FileType go nmap <leader>gd <Plug>(go-def)
  " autocmd BufWritePost *.go gofmt 
  " autocmd FileType go nmap <leader>gr <Plug>(go-run)
  " autocmd FileType go nmap <leader>gb <Plug>(go-build)
  " autocmd FileType go nmap <leader>gt <Plug>(go-test)
  " autocmd FileType go nmap <leader>gc <Plug>(go-coverage)
  " autocmd FileType go nmap <leader>gd <Plug>(go-doc)
  autocmd FileType go nmap <leader>gf <Plug>(go-fmt)
  autocmd FileType go nmap <leader>gi <Plug>(go-imports)
  " autocmd FileType go nmap <leader>gm <Plug>(go-implements)
  autocmd FileType go setlocal tabstop=4
  autocmd FileType go setlocal shiftwidth=4
augroup END

let g:go_fmt_autosave = 0 
let g:go_def_mapping_enabled=0

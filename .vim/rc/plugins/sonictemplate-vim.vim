let g:sonictemplate_vim_template_dir = ['~/.vim/template']

" insert modeでもmappingされてしまうので nmapで指定
" let g:sonictemplate_key = '<leader>it'
" let g:sonictemplate_intelligent_key = '<leader>iT'
nmap <leader>it <plug>(sonictemplate)
nmap <leader>iT <plug>(sonictemplate-intelligent)

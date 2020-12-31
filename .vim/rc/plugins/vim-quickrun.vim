let g:quickrun_config["_"] = {
 \       "hook/close_buffer/enable_empty_data" : 1,
 \       "hook/close_buffer/enable_failure" : 1,
 \       "hook/close_buffer/enable_success" : 1,
 \       "hook/close_quickfix/enable_exit" : 1,
 \       "hook/close_quickfix/enable_success" : 1,
 \       "hook/close_unite_quickfix/enable_hook_loaded" : 1,
 \       "hook/time/enable" : 1,
 \       "hook/unite_quickfix/enable_failure" : 1,
 \       "outputter" : "multi:buffer:quickfix",
 \       "outputter/buffer/split" : "rightbelow",
 \       "runner" : "vimproc",
 \       "runner/vimproc/updatetime" : 40,
 \ }

let g:quickrun_config = {
  \  "opengl": {
    \  'cmdopt': '-lglfw -framework Cocoa -framework OpenGL -framework IOKit -framework CoreVideo',
    \  'command': 'gcc',
    \  'exec': ['%c -o %s:p:r-quickrun %o %s', '%s:p:r-quickrun', 'rm %s:p:r-quickrun'],
  \ }
\}



"--------------------------------------------------------
" deoplete-ternjs 
"--------------------------------------------------------

let g:deoplete#sources#ternjs#filetypes = [
 \ 'jsx',
 \ 'javascript',
 \ 'vue',
 \ ]
let g:deoplete#sources#ternjs#timeout = 3
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1

"--------------------------------------------------------
" deoplete-jedi
"--------------------------------------------------------

" let g:deoplete#sources#jedi#enable_cache = 1


"--------------------------------------------------------
" deoplete-clang
"--------------------------------------------------------

" let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang-3.8.so.1'
" TODO: c++ → clang

" let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/opencv/4.0.1/include/opencv4/opencv'
let g:deoplete#sources#clang#libclang_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
" let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'

" let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/include/c++'
let g:deoplete#sources#clang#clang_header = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang'
" let g:deoplete#sources#clang#clang_header = '/usr/include/c++'

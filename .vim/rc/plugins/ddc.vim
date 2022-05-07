call ddc#custom#patch_global('sources', [
    \ 'nvim-lsp',
    \ 'vsnip',
    \ 'file',
    \ 'around',
    \ 'skkeleton',
  \ ],
  \ )

call ddc#custom#patch_global('sourceOptions', {
  \ '_': {
  \   'ignoreCase': v:true,
  \   'matchers': ['matcher_fuzzy'],
  \   'sorters': ['sorter_fuzzy'],
  \   'converters': ['converter_fuzzy']
  \  },
  \ 'nvim-lsp': {
  \   'mark': 'lsp',
  \   'forceCompletionPattern': '\.\w*|:\w*|->\w*',
  \  },
  \ 'vsnip': {
  \   'mark': 'vsnip',
  \   'dup': v:true,
  \ },
  \ 'around': {
  \   'mark': 'around',
  \   'isVolatile': v:true,
  \ },
  \ 'file': {
  \   'mark': 'file',
  \   'isVolatile': v:true,
  \   'forceCompletionPattern': '\S/\S*',
  \   'matchers': ['matcher_head'],
  \   'converters': [],
  \   'dup': v:true,
  \ },
  \ 'necovim': 'neco',
  \ 'cmdline': 'cmdline',
  \ 'cmdline-history': 'history',
  \ 'skkeleton': {
  \   'mark': 'skkeleton',
  \   'matchers': ['skkeleton'],
  \   'sorters': []
  \ },
  \ })

call ddc#custom#patch_global('sourceParams', {
  \ 'around': {'maxSize': 500},
  \ })
call ddc#enable()

call ddc#custom#patch_global('sources', [
    \ 'nvim-lsp',
    \ 'vsnip',
    \ 'file',
    \ 'around',
  \ ],
  \ )

call ddc#custom#patch_global('sourceOptions', {
  \ '_': #{
  \   ignoreCase: v:true,
  \   matchers: ['matcher_fuzzy'],
  \   sorters: ['sorter_fuzzy'],
  \   converters: ['converter_fuzzy'],
  \ },
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
  \ 'cmdline': {
  \   'mark': 'cmdline',
  \ },
  \ 'necovim': {
  \   'mark': 'neco',
  \ },
  \ 'cmdline-history': {
  \   'mark': 'history',
  \ },
  \ })

call ddc#custom#patch_global('sourceParams', {
  \ 'nvim-lsp': #{ kindLabels: #{ Class: 'c' } },
  \ 'around': {'maxSize': 500},
  \ })
call ddc#enable()

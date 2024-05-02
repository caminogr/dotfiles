call ddc#custom#patch_global('sources', [
    \ 'lsp',
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
  \ 'lsp': {
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

call ddc#custom#patch_global('sourceParams', #{
  \   lsp: #{
  \     snippetEngine: denops#callback#register({
  \           body -> vsnip#anonymous(body)
  \     }),
  \     enableResolveItem: v:true,
  \     enableAdditionalTextEdit: v:true,
  \   },
  \   around: #{
  \     maxSize: 500
  \   },
  \ })

call ddc#enable()

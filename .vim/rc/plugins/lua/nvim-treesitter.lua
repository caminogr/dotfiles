require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true, -- indentation by tree-sitter
  },
  rainbow = {
    enable = true,
    -- extended_mode = true,
    max_file_lines = 300,
  },
  context_commentstring = {
    enable = true,
  },
  matchup = {
    enable = true,
  },
}

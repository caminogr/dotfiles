vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap('i', '<C-b>', 'copilot#Accept("<CR>")', { silent = true, script = true, expr = true })

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md

local null_ls = require("null-ls")
local async_formatting = function(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()

    vim.lsp.buf_request(
        bufnr,
        "textDocument/formatting",
        vim.lsp.util.make_formatting_params({}),
        function(err, res, ctx)
            if err then
                local err_msg = type(err) == "string" and err or err.message
                -- you can modify the log message / level (or ignore it completely)
                vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
                return
            end

            -- don't apply results if buffer is unloaded or has been modified
            if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
                return
            end

            if res then
                local client = vim.lsp.get_client_by_id(ctx.client_id)
                vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
                vim.api.nvim_buf_call(bufnr, function()
                    vim.cmd("silent noautocmd update")
                end)
            end
        end
    )
end


null_ls.setup({
  sources = {
    -- js/ts
    null_ls.builtins.diagnostics.eslint.with({ 
      prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.formatting.prettier,

    -- python
    null_ls.builtins.diagnostics.pylint.with({
      diagnostics_postprocess = function(diagnostic)
        diagnostic.code = diagnostic.message_id
      end,
    }),
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.black,

    -- lua
    null_ls.builtins.diagnostics.luacheck.with({
      extra_args = {"--globals", "vim", "--globals", "awesome"},
    }),

    -- yaml
    null_ls.builtins.diagnostics.yamllint,

    -- rust
    null_ls.builtins.formatting.rustfmt,

    -- dart
    null_ls.builtins.formatting.dart_format,

  },
  debug = false,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePost", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                async_formatting(bufnr)
            end,
        })
    end
  end,
})
vim.keymap.set('n', '<leader>ll', function() vim.lsp.buf.format { async = true } end)

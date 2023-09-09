local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'
-- local util = nvim_lsp.util


-- local on_attach = function(client, bufnr)
on_attach = function(client, bufnr)

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>lrm", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>ll", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<leader>lt",  vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>lre", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>lrf", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>lfm", vim.lsp.buf.format, bufopts)
  vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<Leader>le',  vim.diagnostic.open_float, bufopts)
end



-- Unity
-- https://www.jhonatandasilva.com/published/1623278444
if not configs.omnisharp_mono then
  local pid = vim.fn.getpid()
  -- -- NOTE: need to add permissions to exec the file
  local omnisharp_bin = "/Users/" .. os.getenv("USER") .. "/.local/share/nvim/mason/packages/omnisharp-mono/run"

  configs.omnisharp_mono = {
    default_config = {
     analyze_open_documents_only = false,
     enable_editorconfig_support = true,
     enable_import_completion = false,
     enable_ms_build_load_projects_on_demand = false,
     enable_roslyn_analyzers = false,
     filetypes = { "cs", "vb" },
     organize_imports_on_format = false,
     sdk_include_prereleases = true,

     autostart = true,
     cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
     on_attach = on_attach,
    -- capabilities = capabilities,
     root_dir = lspconfig.util.root_pattern("*.csproj","*.sln"),
    },
  }
  lspconfig.omnisharp_mono.setup{}
end


local mason_lspconfig = require("mason-lspconfig")
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>dof", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>dgp", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<leader>dgn", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>dsl", vim.diagnostic.setloclist, opts)


mason_lspconfig.setup_handlers({
function(server_name)
  local mason_opts = {}

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  mason_opts.on_attach = on_attach
  -- if server_name == "sumneko_lua" then
  --   mason_opts.settings = { Lua = { diagnostics = { globals = { "vim" } } } }
  -- end

  require("lspconfig")[server_name].setup(mason_opts)
end,
})


lspconfig.dartls.setup{
  filetypes = { "dart" },
  on_attach = on_attach,
  capabilities = capabilities,
}


vim.api.nvim_set_option("updatetime", 500)

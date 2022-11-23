local servers = {
  -- 'ansiblels',
  -- 'bashls',
  'clangd',
  'cssls',
  'cssmodules_ls',
  -- 'dockerls',
  -- 'html',
  -- 'intelephense',
  -- 'jsonls',
  -- 'pyright',
  'rust_analyzer',
  'solargraph',
  'tailwindcss',
  -- 'terraformls',
  -- 'tflint',
  'gopls',
  'tsserver',
  'vimls',
  -- 'vuels',
}

-- nvim-lsp-installer
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.setup({
    ensure_installed = servers,
    automatic_installation = true,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- nvim-lspconfig
local nvim_lsp = require('lspconfig')
local util = nvim_lsp.util

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', '<Leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<Leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<Leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<Leader>ln', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<Leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<Leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', '<Leader>le', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
end


-- Language servers
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

-- Golang
-- https://github.com/golang/tools/blob/master/gopls/doc/vim.md
 require'lspconfig'.gopls.setup {
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
    on_attach = on_attach,
    capabilities = capabilities,
  }

-- Ansible
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#ansiblels
-- https://github.com/ansible/ansible-language-server
-- require'lspconfig'.ansiblels.setup{
--   cmd = { "ansible-language-server", "--stdio" },
--   filetypes = { "yaml" },
--   root_dir = function(fname)
--         return util.root_pattern { '*.yml', '*.yaml' }(fname)
--       end,
--   settings = {
--     ansible = {
--       ansible = {
--         path = "ansible",
--       },
--       ansibleLint = {
--         enabled = true,
--         path = "ansible-lint",
--       },
--       python = {
--         interpreterPath = "python",
--       },
--     },
--   },
-- }

-- Bash
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#bashls
-- https://github.com/bash-lsp/bash-language-server
-- require'lspconfig'.bashls.setup{
--   cmd = { "beancount-langserver" },
--   filetypes = { "beancount" },
--   init_options = {
--     journalFile = "",
--     pythonPath = "python3",
--   },
--   root_dir = nvim_lsp.util.root_pattern("elm.json"),
-- }

-- C/C++
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#clangd
-- https://clangd.llvm.org/installation.html
require'lspconfig'.clangd.setup{
  cmd = { "clangd", "--background-index" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = nvim_lsp.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git") or dirname,
  on_attach = on_attach,
  capabilities = capabilities,
}
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#cmake
-- https://github.com/regen100/cmake-language-server
require'lspconfig'.cmake.setup{
  cmd = { "cmake-language-server" },
  filetypes = { "cmake" },
  init_options = {
    buildDirectory = "build",
  },
  root_dir = nvim_lsp.util.root_pattern(".git", "compile_commands.json", "build") or dirname,
  on_attach = on_attach,
  capabilities = capabilities,
}

-- CSS
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#cssls
-- https://github.com/hrsh7th/vscode-langservers-extracted
require'lspconfig'.cssls.setup{
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  settings = {
    css = {
      validate = true,
    },
    less = {
      validate = true,
    },
    scss = {
      validate = true,
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
}

require'lspconfig'.cssmodules_ls.setup {
  on_attach = function(client, bufnr)
    -- client.server_capabilities.definitionProvider = false
    on_attach(client, bufnr)










local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
function dump(o)
 if type(o) == 'table' then
    local s = '{ '
    for k,v in pairs(o) do
       if type(k) ~= 'number' then k = '"'..k..'"' end
       s = s .. '['..k..'] = ' .. dump(v) .. ','
    end
    return s .. '} '
 else
    return tostring(o)
 end
end
-- print( 'variable:', dump(vim.lsp.get_active_clients()))
local clients = vim.lsp.get_active_clients()
print( 'hooo!!!!!!!!!!!!!:')
-- for c in pairs(clients) do
--   print('c:', dump(c))
--   -- local name = c["name"]
--   -- print('name', name)
-- end

local opts = { noremap = true, silent = true }
buf_set_keymap('n', '<Leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
buf_set_keymap('n', '<Leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
buf_set_keymap('n', '<Leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
buf_set_keymap('n', '<Leader>ln', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
buf_set_keymap('n', '<Leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
buf_set_keymap('n', '<Leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
buf_set_keymap('n', '<Leader>le', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)








  end,
  capabilities = capabilities,
    -- optionally
-- init_options = {
--     camelCase = 'dashes',
-- },
}

-- Docker
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#dockerls
-- https://github.com/rcjsuen/dockerfile-language-server-nodejs
-- require'lspconfig'.dockerls.setup{
--   cmd = { "docker-langserver", "--stdio" },
--   filetypes = { "Dockerfile", "dockerfile" },
--   root_dir = nvim_lsp.util.root_pattern("Dockerfile"),
-- }

-- HTML
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#html
-- https://github.com/hrsh7th/vscode-langservers-extracted
-- require'lspconfig'.html.setup{
--   cmd = { "vscode-html-language-server", "--stdio" },
--   filetypes = { "html" },
--   init_options = {
--     configurationSection = { "html", "css", "javascript" },
--     embeddedLanguages = {
--       css = true,
--       javascript = true,
--     },
--   },
--   root_dir = function(fname)
--     return util.root_pattern('package.json', '.git')(fname) or util.path.dirname(fname)
--   end,
--   settings = {}
-- }

-- PHP
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#intelephense
-- https://intelephense.com/
-- require'lspconfig'.intelephense.setup{
--   cmd = { "intelephense", "--stdio" },
--   filetypes = { "php" },
--   root_dir = nvim_lsp.util.root_pattern("composer.json", ".git"),
-- }

-- JSON
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#jsonls
-- https://github.com/hrsh7th/vscode-langservers-extracted
-- require'lspconfig'.jsonls.setup {
--   cmd = { "vscode-json-language-server", "--stdio" },
--   filetypes = { "json" },
--   init_options = {
--     provideFormatter = true,
--   },
--   root_dir = nvim_lsp.util.root_pattern(".git") or dirname,
--   commands = {
--     Format = {
--       function()
--         vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
--       end
--     },
--   },
-- }

-- Python
nvim_lsp.pyright.setup{
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_dir = function(fname)
        local root_files = {
          'pyproject.toml',
          'setup.py',
          'setup.cfg',
          'requirements.txt',
          'Pipfile',
          'pyrightconfig.json',
        }
        return nvim_lsp.util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
      end,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
  },
  capabilities = capabilities,
  on_attach = on_attach,
}

-- Rust
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
-- https://github.com/rust-analyzer/rust-analyzer
require'lspconfig'.rust_analyzer.setup{
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_dir = nvim_lsp.util.root_pattern("Cargo.toml", "rust-project.json"),
  settings = {
    ["rust-analyzer"] = {},
  },
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Ruby
-- Assuming docker is started with 
require'lspconfig'.solargraph.setup{
  cmd = {'nc', '127.0.0.1', "7658"},
  init_options = { formatting = true },
  filetypes = { "ruby" },
  root_dir = util.root_pattern('Gemfile', '.git'),
  settings = {
    solargraph = {
      diagnostics = true,
    },
  },
  -- docs = {
  --   description = [[
-- https://solargraph.org/
-- solargraph, a language server for Ruby
-- You can install solargraph via gem install.
-- ```sh
-- gem install --user-install solargraph
-- ```
  --   ]],
  --   default_config = {
  --     root_dir = [[root_pattern("Gemfile", ".git")]],
  --   },
  -- },
  on_attach = on_attach,
  capabilities = capabilities,
}

-- TailwindCSS
-- https://github.com/tailwindlabs/tailwindcss-intellisense
require'lspconfig'.tailwindcss.setup{
    -- cmd = { "/Users/kamino/setup/tailwindcss-intellisense", "--stdio" },
    cmd = { "tailwindcss-language-server", "--stdio" },

--  cmd = { 
        -- "node", "/Users/kamino/.vscode/extensions/bradlc.vscode-tailwindcss-0.9.1/dist/tailwindServer.js",
        -- "/Users/kamino/setup/tailwindcss-intellisense",
        -- -- "node", "/Users/kamino/setup/tailwindcss-intellisense",
        -- "--stdio"
    -- },
    filetypes = { "html", "css", "sass", "scss", "javascriptreact", "typescriptreact", "typescript.tsx", "vue", "svelte" },
    root_dir = require('lspconfig/util').root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    handlers = {
        ["tailwindcss/getConfiguration"] = function(_, _, params, _, bufnr, _)
            -- tailwindcss lang server waits for this repsonse before providing hover
            vim.lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", {_id = params._id})
        end
    },
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Terraform
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#terraformls
-- https://github.com/hashicorp/terraform-ls
-- require'lspconfig'.terraformls.setup{
--   cmd = { "terraform-ls", "serve" },
--   filetypes = { "terraform" },
--   root_dir = nvim_lsp.util.root_pattern(".terraform", ".git"),
-- }
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#tflint
-- https://github.com/terraform-linters/tflint
-- require'lspconfig'.tflint.setup{
--   cmd = { "tflint", "--langserver" },
--   filetypes = { "terraform" },
--   root_dir = nvim_lsp.util.root_pattern(".terraform", ".git", ".tflint.hcl"),
-- }

-- Typescript
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#tsserver
-- https://github.com/typescript-language-server/typescript-language-server
nvim_lsp.tsserver.setup{
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
    hostInfo = "neovim",
  },
  root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  on_attach = on_attach,
  capabilities = capabilities,
}

local vimls_default_options = {
  diagnostic = {
    enable = true
  },
  indexes = {
    count = 3,
    gap = 100,
    projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
    runtimepath = true
  },
  isNeovim = true,
  iskeyword = "@,48-57,_,192-255,-#",
  runtimepath = "",
  suggest = {
    fromRuntimepath = true,
    fromVimruntime = true
  },
  vimruntime = ""
}

nvim_lsp.vimls.setup{
  cmd = { "vim-language-server", "--stdio" },
  filetypes = { "vim" },
  init_options = vimls_init_options,
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

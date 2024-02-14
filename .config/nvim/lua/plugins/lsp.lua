local servers = {
  tsserver = {},
  lua_ls = {
    workspace = { checkThirdParty = false },
    telemetry = { enable = false },
  },
  rust_analyzer = {},
}

local on_attach = function(_, bufnr)
  local keymap = function(mode, keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
  end

  keymap('n', 'K', vim.lsp.buf.hover, 'Displays hover information')
  keymap({'n', 'i'}, '<C-k>', vim.lsp.buf.signature_help, 'Signature help')
  keymap('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
  keymap('n', 'gD', vim.lsp.buf.references, 'Find references')
  keymap('n', 'gI', vim.lsp.buf.references, 'Go to implementation')
  keymap('n', '<leader>ca', vim.lsp.buf.code_action, 'Code actions')
  keymap('n', '<leader>fm', vim.lsp.buf.format, 'Format document')
  keymap('n', '<leader>ds', vim.lsp.buf.document_symbol, 'Document Symbols')
  keymap('n', '<leader>ws', vim.lsp.buf.workspace_symbol, 'Workspace Symbols')
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
  documentationFormat = { 'markdown', 'plaintext' },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    },
  },
}

return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup {}
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      local mason_lspconfig = require 'mason-lspconfig'

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
          }
        end,
      }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'folke/neodev.nvim', opts = {} },
    },
  },
}

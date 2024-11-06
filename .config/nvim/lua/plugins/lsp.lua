local servers = {
  angularls = {},
  cssls = {},
  cssmodules_ls = {},
  biome = {},
  docker_compose_language_service = {},
  dockerls = {},
  emmet_language_server = {},
  gopls = { -- Remember to manually install goimports_reviser, gofumpt and golines using mason
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
  html = {},
  htmx = {},
  pyright = {},
  lua_ls = {
    workspace = { checkThirdParty = false },
    telemetry = { enable = false },
  },
  svelte = {},
  tailwindcss = {},
  ts_ls = {
    -- on_attach = function(client)
    --   -- this is important, otherwise tsserver will format ts/js
    --   -- files which we *really* don't want.
    --   client.server_capabilities.documentFormattingProvider = false
    -- end,
  },
  rust_analyzer = {
    settings = {
      ['rust-analyzer'] = {
        cargo = {
          allFeatures = true,
        },
      },
    },
  },
}

local on_attach = function(_, bufnr)
  -- vim.lsp.inlay_hint.enable(true)

  local keymap = function(mode, keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
  end

  local builtin = require('telescope.builtin')

  keymap('n', 'K', vim.lsp.buf.hover, 'Displays hover information')
  keymap({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help, 'Signature help')
  keymap('n', 'gc', function()
    vim.lsp.buf.typehierarchy('subtypes')
  end, 'Go to children definition')
  keymap('n', 'gp', function()
    vim.lsp.buf.typehierarchy('supertypes')
  end, 'Go to parents definition')
  keymap('n', '<leader>ca', vim.lsp.buf.code_action, 'Code actions')
  keymap({ 'n', 'i' }, '<M-CR>', vim.lsp.buf.code_action, 'Code actions')
  keymap('n', '<leader>fm', function()
    vim.lsp.buf.format({
      filter = function(client)
        return client.name ~= 'ts_ls'
      end,
    })
  end, 'Format document')
  keymap('n', 'gd', builtin.lsp_definitions, '[G]oto [D]efinition')
  keymap('n', 'gr', builtin.lsp_references, '[G]oto [R]eferences')
  keymap('n', 'gI', builtin.lsp_implementations, '[G]oto [I]mplementation')
  keymap('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  keymap('n', '<leader>td', builtin.lsp_type_definitions, 'Type [D]efinition')
  keymap('n', '<leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
  keymap('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  keymap('n', '<leader>q', builtin.diagnostics, 'diagnostics')
  keymap('n', '<leader>si', function()
    local is_inlay_hit_enabled = vim.lsp.inlay_hint.is_enabled(nil)
    vim.lsp.inlay_hint.enable(not is_inlay_hit_enabled)
  end)
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
      require('mason').setup({})
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      { 'nvim-telescope/telescope.nvim', tag = '0.1.5' },
    },
    config = function()
      local mason_lspconfig = require('mason-lspconfig')

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          require('lspconfig')[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
          })
        end,
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {

      { 'folke/neodev.nvim',             opts = {} },
      { 'nvim-telescope/telescope.nvim', tag = '0.1.5' },
      { 'j-hui/fidget.nvim',             opts = {} },
    },
  },
  {
    'rust-lang/rust.vim',
    ft = 'rust',
    config = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  -- {
  --      "simrat39/rust-tools.nvim",
  --      dependencies = "neovim/nvim-lspconfig",
  --      ft = "rust",
  --      opts = function()
  --              return {
  --                      server = {
  --                              on_attach = on_attach,
  --                              capabilities = capabilities,
  --                      },
  --              }
  --      end,
  --      config = function(_, opts)
  --              require "rust-tools".setup(opts);
  --      end,
  -- },

  -- NOTE: install codelldb -- using mason run :MasonInstall codelldb
  -- NOTE: install rust_analyzer -- using mason run :MasonInstall rust-analyzer
  -- {
  --      'mrcjkb/rustaceanvim',
  --      version = '^4', -- Recommended
  --      ft = { 'rust' },
  -- },
}

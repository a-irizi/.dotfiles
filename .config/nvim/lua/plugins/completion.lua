return {
  {
    'saghen/blink.cmp',
    -- !Important! Make sure you're using the latest release of LuaSnip
    -- `main` does not work at the moment
    dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      completion = {
        ghost_text = { enabled = true },
      },
      snippets = { preset = 'luasnip' },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = 'mono',
      },

      signature = { enabled = true },
      keymap = {
        preset = 'default',
        ['<Tab>'] = {},
        ['<S-Tab>'] = {},
        ['<M-l>'] = { 'snippet_forward', 'fallback' },
        ['<M-h>'] = { 'snippet_backward', 'fallback' },
      },
    },
    opts_extend = { 'sources.default' },
  },
}

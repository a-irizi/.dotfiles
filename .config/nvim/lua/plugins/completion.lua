return {
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'L3MON4D3/LuaSnip' },
    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      completion = {
        ghost_text = { enabled = true },
      },
      sources = {
        default = { 'lsp', 'path', 'luasnip', 'buffer' },
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

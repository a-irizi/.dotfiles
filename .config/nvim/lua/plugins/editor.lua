return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  { -- Highlight colors within Neovim
    'brenoprata10/nvim-highlight-colors',
    config = function()
      local nhc = require('nvim-highlight-colors')
      nhc.setup({
        render = 'virtual',
      })
    end,
  },
}

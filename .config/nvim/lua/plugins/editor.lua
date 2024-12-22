return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
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

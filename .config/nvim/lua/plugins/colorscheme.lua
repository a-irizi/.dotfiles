return {
  "f-person/auto-dark-mode.nvim",
  dependencies = { "catppuccin/nvim", "projekt0n/github-nvim-theme", "sainnhe/edge" },
  name = "auto-colorscheme",
  priority = 1000,
  config = function()
    local auto_dark_mode = require("auto-dark-mode")

    auto_dark_mode.setup({
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option_value("background", "dark", {})
        vim.cmd.colorscheme("catppuccin")
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value("background", "light", {})
        vim.cmd([[
				let g:edge_style = 'aura'
				let g:edge_better_performance = 1
				colorscheme edge
				]])
      end,
    })
  end,
}

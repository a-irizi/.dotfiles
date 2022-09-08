local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  highlights = {
    buffer_selected = {
      fg = '#cdcecf',
      bg = '#2b3b51',
      bold = true,
      italic = true,
    },
    separator = {
      bg = '#131a24',
      fg = '#192330',
    },
    separator_selected = {
      bg = '#2b3b51',
      fg = '#192330',
    },
    fill = {
      bg = '#192330',
    },
    background = {
      fg = '#cdcecf',
      bg = '#131a24',
    },
    modified = {
      bg = '#131a24',
    },
    modified_selected = {
      bg = '#2b3b51',
    },
    diagnostic = {
      bg = '#131a24',
    },
    diagnostic_selected = {
      bg = '#2b3b51',
      bold = true,
      italic = true,
    },
    hint_selected = {
      bg = '#2b3b51',
      bold = true,
      italic = true,
    },
    hint = {
      bg = '#131a24',
    },
    hint_diagnostic_selected = {
      bg = '#2b3b51',
      bold = true,
      italic = true,
    },
    hint_diagnostic = {
      bg = '#131a24',
    },
    info_selected = {
      bg = '#2b3b51',
      bold = true,
      italic = true,
    },
    info = {
      bg = '#131a24',
    },
    info_diagnostic_selected = {
      bg = '#2b3b51',
      bold = true,
      italic = true,
    },
    info_diagnostic = {
      bg = '#131a24',
    },
    warning_selected = {
      bg = '#2b3b51',
      bold = true,
      italic = true,
    },
    warning = {
      bg = '#131a24',
    },
    warning_diagnostic_selected = {
      bg = '#2b3b51',
      bold = true,
      italic = true,
    },
    warning_diagnostic = {
      bg = '#131a24',
    },
    error_selected = {
      bg = '#2b3b51',
      bold = true,
      italic = true,
    },
    error = {
      bg = '#131a24',
    },
    error_diagnostic_selected = {
      bg = '#2b3b51',
      bold = true,
      italic = true,
    },
    error_diagnostic = {
      bg = '#131a24',
    },
    tab_selected = {
      bg = '#2b3b51',
    },
  },
  options = {
    mode = 'tabs',
    diagnostics = "nvim_lsp",
    separator_style = "slant",
    indicator = {
      style = 'none',
    },
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
  }

})

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<M-t>', '<cmd>BufferLineCycleNext<cr>', opts)
keymap.set('n', '<M-T>', '<cmd>BufferLineCyclePrev<cr>', opts)

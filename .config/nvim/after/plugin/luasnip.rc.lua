local status, ls = pcall(require, "luasnip")
if (not status) then
  print("failed to load luasnip")
  return
end
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

ls.config.set_config({
  history = true,
  update_events = 'TextChanged,TextChangedI',
  enable_autosnippets = true,
})

local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

keymap({ "i", "s" }, "<M-e>", function()
  if ls.expand_or_jumpable() then
    ls.expand()
  end
end,
  opts)
keymap({ "i", "s" }, "<M-j>", function()
  if ls.jumpable(1) then
    ls.jump(1)
  end
end,
  opts)
keymap({ "i", "s" }, "<M-k>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end,
  opts)
keymap({ "i", "s" }, "<M-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end,
  opts)
keymap({ "i", "s" }, "<M-h>", function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end,
  opts)

local luasnip = require("luasnip")
local s = luasnip.s --> snnipet
local i = luasnip.i --> insert node
local t = luasnip.t --> text node

local c = luasnip.choice_node
local d = luasnip.dynamic_node
local f = luasnip.function_node
local sn = luasnip.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}

local snippetBoilerPlate = s(
	{
		trig = "bk",
		dscr = "bind-key snippet",
	},
	fmt(
		[[
bind-key {}
{}
]],
		{
			i(1, ""),
			i(0),
		}
	)
)
table.insert(autosnippets, snippetBoilerPlate)

return snippets, autosnippets

require("luasnip.session.snippet_collection").clear_snippets("rust")

local ls = require("luasnip")
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local s = ls.snippet
local c = ls.choice_node
local d = ls.dynamic_node
local i = ls.insert_node
local t = ls.text_node
local sn = ls.snippet_node

ls.add_snippets(
	"rust",
	s(
		"cs",
		fmta(
			[[
let (<signal_var>, set_<signal_var>) = create_signal(<default_value>);<finish>
			]],
			{
				signal_var = i(1),
				default_value = i(2),
				finish = i(0),
			}
		)
	)
)

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

local usestate = s({
	trig = "useStateSnippet",
	dscr = "React useState snippet",
}, {
	t("const ["),
	i(1, "myVar"),
	t(", "),
	f(function(args, snip)
		return "set" .. string.sub(args[1][1], 1, 1):upper() .. string.sub(args[1][1], 2, args[1][1]:len())
	end, 1),
	t("] = useState("),
	i(2),
	t(")"),
})
table.insert(snippets, usestate)

local cc = s(
	{
		trig = "cc",
		dscr = "Create react component",
	},
	fmt(
		[[
import React from "react";

const {} = ({}) => {{
  return <div>{}</div>;
}};

export default {};{}
    ]],
		{
			d(1, function(args, parent)
				local env = parent.snippet.env
				return sn(nil, i(1, env.TM_FILENAME:match("(.+)%..+")))
			end),
			c(2, { i(1, "props"), i(2, "") }),
			d(3, function(args, parent)
				return sn(nil, i(1, args[1]))
			end, { 1 }),
			rep(1),
			i(0, ""),
		}
	)
)
table.insert(autosnippets, cc)

return snippets, autosnippets

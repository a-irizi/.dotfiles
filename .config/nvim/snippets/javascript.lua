local luasnip = require("luasnip")
local s = luasnip.s --> snnipet
local i = luasnip.i --> insert node
local t = luasnip.t --> text node

local c = luasnip.choice_node
local r = luasnip.restore_node
local d = luasnip.dynamic_node
local f = luasnip.function_node
local sn = luasnip.snippet_node
local isn = luasnip.indent_snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}

-- insert snippets here

-- conditionals
local ifSnippet = s(
	";if",
	fmt(
		[[
if ({}) {{
    {}
}}{}
    ]],
		{
			i(1, "condition"),
			i(2, "// TODO: Insert if statement body"),
			i(0),
		}
	)
)
table.insert(autosnippets, ifSnippet)

local elseIfSnippet = s(
	";elif",
	fmt(
		[[
else if ({}) {{
    {}
}}{}
    ]],
		{
			i(1, "condition"),
			i(2, "// TODO: Insert if statement body"),
			i(0),
		}
	)
)
table.insert(autosnippets, elseIfSnippet)

local elseSnippet = s(
	";else",
	fmt(
		[[
else {{
    {}
}}{}
    ]],
		{
			i(1, "// TODO: Insert else statement body"),
			i(0),
		}
	)
)
table.insert(autosnippets, elseSnippet)

-- loops

local whileLoopSnippet = s({
	trig = ";wl",
	dscr = "while loop snippet",
}, {
	c(1, {
		sn(
			nil,
			fmt(
				[[
while ({}) {{
    {}
}}
{}
        ]],
				{
					r(1, "condition"),
					r(2, "body"),
					i(0),
				}
			)
		),
		sn(
			nil,
			fmt(
				[[
do {{
    {}
}} while ({});
{}
        ]],
				{
					r(2, "body"),
					r(1, "condition"),
					i(0),
				}
			)
		),
	}),
}, {
	stored = {
		["condition"] = i(1, "condition"),
		["body"] = i(1, "// TODO: Insert while loop body"),
	},
})
table.insert(autosnippets, whileLoopSnippet)

local forLoopStatement = s(
	{
		trig = ";fl",
		dscr = "for loop snippet",
	},
	fmt(
		[[
for ({}) {{
    {}
}}
{}
    ]],
		{
			c(1, {

				sn(
					1,
					fmt(
						[[
{}; {}; {}
      ]],
						{
							i(1, "statement1"),
							i(2, "statement2"),
							i(3, "statement3"),
						}
					)
				),
				sn(
					2,
					fmt(
						[[
{} of {}
            ]],
						{
							i(1, "element"),
							i(2, "iterable"),
						}
					)
				),
			}),
			i(2, "// TODO: Insert for loop body"),
			i(0),
		}
	)
)
table.insert(autosnippets, forLoopStatement)

local switchSnippet = s(
	{
		trig = ";sch",
		dscr = "switch statement snippet",
	},
	fmt(
		[[
switch({}) {{
    {}
}}
{}
    ]],
		{
			i(1),
			c(2, {
				r(1, "switch body"),
				isn(
					2,
					fmt(
						[[
{}

default:
    {};
          ]],
						{
							r(1, "switch body"),
							i(2, "// TODO: Insert default code"),
						}
					),
					"$PARENT_INDENT\t"
				),
			}),
			i(0),
		}
	),
	{
		stored = {
			["switch body"] = i(1),
		},
	}
)
table.insert(autosnippets, switchSnippet)

local caseSnippet = s(
	{
		trig = ";case",
		dscr = "case block snippet",
	},
	fmt(
		[[
case {}:
    {}
{}
    ]],
		{
			i(1),
			c(2, {
				isn(
					nil,
					fmt(
						[[
{}
break;
          ]],
						{
							r(1, "case body"),
						}
					),
					"$PARENT_INDENT\t"
				),
				isn(
					nil,
					fmt(
						[[
{}
          ]],
						{
							r(1, "case body"),
						}
					),
					"$PARENT_INDENT\t"
				),
			}),
			i(0),
		}
	),
	{
		stored = {
			["case body"] = i(1),
		},
	}
)
table.insert(autosnippets, caseSnippet)

-- functions
local functionSnippet = s(
	{
		trig = ";fnc",
		dscr = "function snippet",
	},
	fmt(
		[[
function {}({}) {{
    {}
}}
{}
    ]],
		{
			i(1, "name"),
			i(2),
			i(3, "// TODO: Insert function body"),
			i(0),
		}
	)
)
table.insert(autosnippets, functionSnippet)

-- output
local printSnippet = s({
	trig = ";rnt",
	dscr = "print message snippet",
}, {
	c(1, {
		sn(nil, { t("console.log("), r(1, "message"), t(")") }),
		sn(nil, { t("alert("), r(1, "message"), t(")") }),
	}),
}, {
	stored = {
		["message"] = i(1, "'hello world'"),
	},
})
table.insert(autosnippets, printSnippet)

return snippets, autosnippets

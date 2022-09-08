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
		trig = "snb",
		dscr = "Luasnip snippet file boiler plate.",
	},
	fmt(
		[[
local luasnip = require('luasnip')
local s = luasnip.s --> snnipet
local i = luasnip.i --> insert node
local t = luasnip.t --> text node

local c = luasnip.choice_node
local d = luasnip.dynamic_node
local f = luasnip.function_node
local sn = luasnip.snippet_node

local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

local snippets, autosnippets = {{}}, {{}}

{}

return snippets, autosnippets
    ]],

		{
			i(1, "-- insert snippets here"),
		}
	)
)
table.insert(autosnippets, snippetBoilerPlate)
local aLocal = s(
	"lcl",
	fmt(
		[[
local {} = {}
    ]],
		{
			i(1, "myVar"),
			i(2, "nil"),
		}
	)
)
table.insert(autosnippets, aLocal)

local aLFunction = s(
	"lfnc",
	fmt(
		[[
{}
    ]],
		{
			c(1, {
				sn(
					1,
					fmt(
						[[
local {} = function({})
  {}
end
{}
    ]],
						{
							i(1, "myVar"),
							c(2, { t(""), i(1, "args") }),
							i(3, "-- TODO: insert function body"),
							i(0),
						}
					)
				),
				sn(
					1,
					fmt(
						[[
local function {}({})
  {}
end
{}
    ]],
						{
							i(1, "myVar"),
							c(2, { t(""), i(1, "args") }),
							i(3, "-- TODO: insert function body"),
							i(0),
						}
					)
				),
			}),
		}
	)
)
table.insert(autosnippets, aLFunction)

local aFunction = s(
	"fnc",
	fmt(
		[[
{}
    ]],
		{
			c(1, {
				sn(
					1,
					fmt(
						[[
function {}({})
  {}
end
{}
    ]],
						{
							i(1, "myVar"),
							c(2, { t(""), i(1, "args") }),
							i(3, "-- TODO: insert function body"),
							i(0),
						}
					)
				),
				sn(
					1,
					fmt(
						[[
{} = function({})
  {}
end
{}
    ]],
						{
							i(1, "myVar"),
							c(2, { t(""), i(1, "args") }),
							i(3, "-- TODO: insert function body"),
							i(0),
						}
					)
				),
			}),
		}
	)
)
table.insert(autosnippets, aFunction)

local function random_lang()
	return ({ "LUA", "VIML", "VIML9" })[math.floor(math.random() / 2 + 1.5)]
end

luasnip.env_namespace("MY", { vars = { NAME = "LuaSnip", LANG = random_lang } })

-- then you can use  $MY_NAME and $MY_LANG in your snippets

luasnip.env_namespace("SYS", { vars = os.getenv, eager = { "HOME" } })

-- then you can use  $SYS_HOME which was eagerly initialized but also $SYS_USER (or any other system environment var) in your snippets

local usestate = s(
	"custom_env",
	d(1, function(args, parent)
		local env = parent.snippet.env
		return sn(
			nil,
			t({
				"file name " .. env.TM_FILENAME:match("(.+)%..+"),
			})
		)
	end, {})
)
table.insert(snippets, usestate)

return snippets, autosnippets

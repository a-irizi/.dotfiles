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

local deriveSnippet = s(
  {
    trig = "derive",
    dscr = "derive annotation",
  },
  fmt(
    [[
#[derive({}{})]
    ]],

    {
      i(1, "Debug"),
      i(0),
    }
  )
)
table.insert(snippets, deriveSnippet)

local deriveStructSnippet = s(
  {
    trig = "dstruct",
    dscr = "struct with derive annotation",
  },
  fmt(
    [[
#[derive({}{})]
struct {} {{
	{}
}}
    ]],
    {
      i(1, "Debug"),
      i(2),
      i(3, "MyStruct"),
      i(0),
    }
  )
)
table.insert(snippets, deriveStructSnippet)

local deriveEnumSnippet = s(
  {
    trig = "denum",
    dscr = "enum with derive annotation",
  },
  fmt(
    [[
#[derive({}{})]
enum {} {{
	{}
}}
    ]],
    {
      i(1, "Debug"),
      i(2),
      i(3, "MyStruct"),
      i(0),
    }
  )
)
table.insert(snippets, deriveEnumSnippet)

local leptosComponent = s(
  {
    trig = "ncmp",
    dscr = "leptos component",
  },
  fmt(
    [[
#[{}]
pub fn {}({}) -> impl IntoView {{
	view!{{
		{}
	}}
}}
    ]],
    {
      i(1, "component"),
      i(2, "MyComponent"),
      i(3),
      i(0),
    }
  )
)
table.insert(snippets, leptosComponent)

local leptosComponentWithImports = s(
  {
    trig = "ncmpi",
    dscr = "leptos component with imports",
  },
  fmt(
    [[
use leptos::*;

#[{}]
pub fn {}({}) -> impl IntoView {{
	view!{{
		{}
	}}
}}
    ]],
    {
      i(1, "component"),
      i(2, "MyComponent"),
      i(3),
      i(0),
    }
  )
)
table.insert(snippets, leptosComponentWithImports)

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

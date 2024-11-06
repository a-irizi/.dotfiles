require("luasnip.session.snippet_collection").clear_snippets("svelte")

local ls = require("luasnip")
local fmta = require("luasnip.extras.fmt").fmta
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local s = ls.snippet
local c = ls.choice_node
local d = ls.dynamic_node
local i = ls.insert_node
local t = ls.text_node
local sn = ls.snippet_node

local snippets, autosnippets = {}, {}
local if_snippet = s(
  {
    trig = ";if",
    dscr = "if block",
  },
  fmta(
    [[
{#if <condition>}
	<body>
{/if}
			]],
    {
      condition = i(1),
      body = i(0),
    }
  )
)
table.insert(snippets, if_snippet)

local component_skeleton = s(
  {
    trig = ";skl",
    dscr = "new component skeleton",
  },
  fmt(
    [[
<script lang="ts">
	{}
</script>

<{}{}>
	{}
</{}>

<style>
</style>
		]],
    {
      i(1),
      i(2, "div"),
      i(3),
      i(4),
      rep(2),
    }
  )
)

table.insert(snippets, component_skeleton)
return snippets, autosnippets

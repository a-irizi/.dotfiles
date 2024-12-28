local luasnip = require('luasnip')
local s = luasnip.s --> snnipet
local i = luasnip.i --> insert node
local t = luasnip.t --> text node

local c = luasnip.choice_node
local r = luasnip.restore_node
local d = luasnip.dynamic_node
local f = luasnip.function_node
local sn = luasnip.snippet_node
local isn = luasnip.indent_snippet_node

local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

local snippets, autosnippets = {}, {}

local deriveSnippet = s(
  {
    trig = 'derive',
    dscr = 'derive annotation',
  },
  fmt(
    [[
#[derive({}{})]
    ]],

    {
      i(1, 'Debug'),
      i(0),
    }
  )
)
table.insert(snippets, deriveSnippet)

local deriveStructSnippet = s(
  {
    trig = 'dstruct',
    dscr = 'struct with derive annotation',
  },
  fmt(
    [[
#[derive({}{})]
struct {} {{
	{}
}}
    ]],
    {
      i(1, 'Debug'),
      i(2),
      i(3, 'MyStruct'),
      i(0),
    }
  )
)
table.insert(snippets, deriveStructSnippet)

local deriveEnumSnippet = s(
  {
    trig = 'denum',
    dscr = 'enum with derive annotation',
  },
  fmt(
    [[
#[derive({}{})]
enum {} {{
	{}
}}
    ]],
    {
      i(1, 'Debug'),
      i(2),
      i(3, 'MyStruct'),
      i(0),
    }
  )
)
table.insert(snippets, deriveEnumSnippet)

local leptosComponent = s(
  {
    trig = 'ncmp',
    dscr = 'leptos component',
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
      i(1, 'component'),
      i(2, 'MyComponent'),
      i(3),
      i(0),
    }
  )
)
table.insert(snippets, leptosComponent)

local leptosComponentWithImports = s(
  {
    trig = 'ncmpi',
    dscr = 'leptos component with imports',
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
      i(1, 'component'),
      i(2, 'MyComponent'),
      i(3),
      i(0),
    }
  )
)
table.insert(snippets, leptosComponentWithImports)

local testmod = s(
  {
    trig = 'tmd',
    dscr = 'Test module',
  },
  fmt(
    [[
#[cfg(test)]
mod tests {{
  use super::*;

  {}
}}
]],
    {
      c(1, {
        sn(1, fmt([[{}]], { i(1) })),
        isn(
          2,
          fmt(
            [[
#[test]
fn {}({}) {{
  {}
}}
          ]],
            {
              i(1, 'it_works'),
              i(2),
              i(3),
            }
          ),
          '$PARENT_INDENT\t'
        ),
      }),
    }
  )
)
table.insert(snippets, testmod)

local testFunction = s(
  {
    trig = 'tfn',
    dscr = 'Test function',
  },
  fmt(
    [[
#[test]
fn {}({}) {{
  {}
}}
    ]],
    {
      i(1, 'it_works'),
      i(2),
      i(0),
    }
  )
)
table.insert(snippets, testFunction)

local printToStdout = s(
  {
    trig = 'sout',
    dscr = 'Print to stdout',
  },
  fmt(
    [[
println!("{}");
    ]],
    {
      c(1, { sn(nil, fmt('{{{}}}', { i(1) })), i(nil) }),
    }
  )
)
table.insert(snippets, printToStdout)

local mainFunction = s(
  {
    trig = 'main',
    dscr = 'main function',
  },
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
fn main() {{
  {}
}}
            ]],
            { i(1) }
          )
        ),
        sn(
          2,
          fmt(
            [[

use std::error::Error;

fn main() -> Result<(), Box<dyn Error>> {{
  {}

  Ok(())
}}
            ]],
            { i(1) }
          )
        ),
      }),
    }
  )
)
table.insert(snippets, mainFunction)

local function random_lang()
  return ({ 'LUA', 'VIML', 'VIML9' })[math.floor(math.random() / 2 + 1.5)]
end

luasnip.env_namespace('MY', { vars = { NAME = 'LuaSnip', LANG = random_lang } })

-- then you can use  $MY_NAME and $MY_LANG in your snippets

luasnip.env_namespace('SYS', { vars = os.getenv, eager = { 'HOME' } })

-- then you can use  $SYS_HOME which was eagerly initialized but also $SYS_USER (or any other system environment var) in your snippets

local usestate = s(
  'custom_env',
  d(1, function(args, parent)
    local env = parent.snippet.env
    return sn(
      nil,
      t({
        'file name ' .. env.TM_FILENAME:match('(.+)%..+'),
      })
    )
  end, {})
)
table.insert(snippets, usestate)

local if_let_some = s(
  {
    trig = 'ils',
    dscr = 'if let Some',
  },
  fmt(
    [[
if let Some({}) = {} {{
  {}
}}
    ]],
    {
      i(2),
      i(1),
      i(0),
    }
  )
)
table.insert(snippets, if_let_some)

local if_let_result = s(
  {
    trig = 'ilr',
    dscr = 'if let Result',
  },
  fmt(
    [[
if let {}({}) = {} {{
  {}
}}
    ]],
    {
      c(2, { t('Ok'), t('Err') }),
      i(3),
      i(1),
      i(0),
    }
  )
)
table.insert(snippets, if_let_result)
-- local rust_last_local_variable = function()
--   local node = vim.treesitter.get_node()
--   node.prev_sibling()
-- end
--
-- local print_previous_local_variable = s(
--   {
--     trig = 'plv',
--     dscr = 'println and expression using last declared local variable',
--   },
--   fmta(
--     [[
-- println!("<var_same><exp_same> {}", <var><exp>);<finish>
-- ]],
--     {
--       var = t(1, rust_last_local_variable),
--       exp = i(2),
--       var_same = rep(1),
--       exp_same = rep(2),
--       finish = i(0),
--     }
--   )
-- )
-- table.insert(snippets, print_previous_local_variable)

return snippets, autosnippets

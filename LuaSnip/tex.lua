-- tex snippets for LuaSnip
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

-- Math context detection 
local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

local in_text = function()
  return not in_mathzone
end


return {
-- autosnippets generally begins with ';',
  -- since you never insert anything other than a space after ';' in any other situations.

-- 1. Equations
-- 1.1 General structures and expressions
s({trig=";ff", dscr="fraction", snippetType="autosnippet", wordTrig=false},
  fmta(
      "\\frac{<>}{<>}",
      {
        i(1),
        i(2),
      }
    )
),
s({trig=";sq", dscr="square root", snippetType="autosnippet", wordTrig=false},
  fmta(
      "\\sqrt{<>}",
      { i(1) }
    )
),
s({trig=";bs", dscr="boldsymbol", snippetType="autosnippet", wordTrig=false},
  fmta(
      "\\boldsymbol{<>}",
      { i(1) }
    )
),
s({trig=";lb", dscr="brackets ()", snippetType="autosnippet", wordTrig=false},
  fmta(
      "\\left(<>\\right)",
      { i(1) }
    )
),
s({trig=";lB", dscr="brackets []", snippetType="autosnippet", wordTrig=false},
  fmta(
      "\\left[<>\\right]",
      { i(1) }
    )
),
s({trig=";LB", dscr="brackets {}", snippetType="autosnippet", wordTrig=false},
  fmta(
      "\\left\\{<>\\right\\}",
      { i(1) }
    )
),
s({trig=";abs", dscr="absolute value", snippetType="autosnippet", wordTrig=false},
  fmta(
      "\\left|<>\\right|",
      { i(1) }
    )
),
s({trig="^", dscr="superscript", snippetType="autosnippet", wordTrig=false}, -- in math envs, I always want a {} after ^
  fmta(
      "^{<>}",
      { i(1) }
    ),
  {condition = in_mathzone}
  ),
s({trig="_", dscr="subscript", snippetType="autosnippet", wordTrig=false}, -- in math envs, I always want a {} after _
  fmta(
      "_{<>}",
      { i(1) }
    ),
  {condition = in_mathzone}
),
s({trig=";ptl", dscr="partial", snippetType="autosnippet", wordTrig=false},
  {t("\\partial"),}
),
s({trig=";ii", dscr="imaginary unit", snippetType="autosnippet", wordTrig=false},
  {t("\\mathrm{i}"),}
),
s({trig=";ee", dscr="constant e", snippetType="autosnippet", wordTrig=false},
  {t("\\mathrm{e}"),}
),
s({trig=";rar", dscr="rightarrow", snippetType="autosnippet", wordTrig=false},
  {t("\\rightarrow"),}
),
s({trig=",,,", dscr=",...,", snippetType="autosnippet", wordTrig=false},
  {t(",\\ldots,"),}
),
s({trig="+++", dscr="+...+", snippetType="autosnippet", wordTrig=false},
  {t("+\\ldots+"),}
),
s({trig=";trans", dscr="transpose", snippetType="autosnippet", wordTrig=false},
  {t("^{\\mathsf{T}}"),}
),
-- 1.2 font styles
s({trig=";mrm", dscr="mathrm", snippetType="autosnippet", wordTrig=false},
  fmta(
      "\\mathrm{<>}",
      { i(1) }
    )
),
s({trig=";mbb", dscr="mathbb", snippetType="autosnippet", wordTrig=false},
  fmta(
      "\\mathbb{<>}",
      { i(1) }
    )
),
s({trig=";mcl", dscr="mathcal", snippetType="autosnippet", wordTrig=false},
  fmta(
      "\\mathcal{<>}",
      { i(1) }
    )
),
s({trig=";txt", dscr="text", snippetType="autosnippet", wordTrig=false},
  fmta(
      "\\text{<>}",
      { i(1) }
    )
),
-- 1.3 specific fields
-- 1.3.1 quantum mechanics
s({trig=";k", dscr="ket", snippetType="autosnippet", wordTrig=false},
  fmta(
      "\\ket{<>}",
      { i(1) }
    )
),
s({trig=";br", dscr="bra", snippetType="autosnippet", wordTrig=false},
  fmta(
      "\\bra{<>}",
      { i(1) }
    )
),
s({trig=";bk", dscr="braket", snippetType="autosnippet", wordTrig=false},
  fmta(
      "\\braket{<>}",
      { i(1) }
    )
),
s({trig=";K", dscr="Ket", snippetType="autosnippet", wordTrig=false},
  fmta(
      "\\Ket{<>}",
      { i(1) }
    )
),
s({trig=";Br", dscr="Bra", snippetType="autosnippet", wordTrig=false},
  fmta(
      "\\Bra{<>}",
      { i(1) }
    )
),
s({trig=";BK", dscr="Braket", snippetType="autosnippet", wordTrig=false},
  fmta(
      "\\Braket{<>}",
      { i(1) }
    )
),
-- 2. Environments
s({trig=";begin", dscr="LaTeX environment", snippetType="autosnippet", wordTrig=false},
  fmta(
    [[
      \begin{<>}
          <>
      \end{<>}
    ]],
    {
      i(1),
      i(2),
      rep(1),  -- this node repeats insert node i(1)
    }
  )
),
s({trig=";eq", dscr="A LaTeX equation environment", snippetType="autosnippet", wordTrig=false},
  fmta(
     [[
       \begin{equation}
           <>
       \end{equation}
     ]],
     { i(1) }
  )
),
s({trig=";il", dscr="inline equation", snippetType="autosnippet", wordTrig=false},
  fmta(
     [[
      $<>$
     ]],
     { i(1) }
  )
),
s({trig="\\definition", dscr="definition env"},
  fmta(
     [[
       \begin{definition}
           <>
       \end{definition}
     ]],
     { i(1) }
  )
),
s({trig="\\lemma", dscr="lemma env"},
  fmta(
     [[
       \begin{lemma}
           <>
       \end{lemma}
     ]],
     { i(1) }
  )
),
s({trig="\\itemize", dscr="itemize env"},
  fmta(
     [[
       \begin{itemize}
           <>
       \end{itemize}
     ]],
     { i(1) }
  )
),
}

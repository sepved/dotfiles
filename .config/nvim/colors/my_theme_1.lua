vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "my_theme_1"

-- pendiente (ordenados por prioridad):
-- 1. constant
-- 2. string

local c = {
  bg           = "#151622", -- #00164b#001850#001a55#0b1d5a#323223#040b29#03071b#0b0c13#070917#020221#0b0c13#151622#141623#131524#111426#0e1229#13241f#132224
  bg_alt       = "#000000", -- #0d1322#3a5598#220d15#01140f
  bg_float     = "#00222e", -- #00222e
  fg_float     = "#8a8a8a", -- 
  fg           = "#d7acf7", -- #bd61ff#dfb3ff#d7acf7
  fg_alt       = "#908ee7", -- #8683f2#908ee7
  border       = "#000000",
  line_nr      = "#3d4b68",
  cursor_line  = "#1a253d",

  comment      = "#43523e", -- #3e5e32#43523e 
  keyword      = "#a8e5f7", -- #3fb7de#6ac8e5#45d4ff#8bd1e6#a8e5f7#
  func         = "#9c4b5e", -- #d991e3#84a4b4#b4a284#8536c0#9e2df2#f22d98#b51d40#9e203d#aa3d56#9c4b5e
  type         = "#93619e", -- #9e6182#96619e
  string       = "#d5ad6d", -- #4e8923#23896c#25a02b#0b4308#118687#44b6c5#73bfc9#73c9ba#7ac2b6#79beb0#6596d2#9765d2#d5ad6d
  number       = "#f7acf2", -- #f7acf2#
  variable     = "#b1b1b1", -- #808080#a6a6a6#cacaca#
  field        = "#e0e7f5",
  constant     = "#c69d8f", -- #9e6182#8e397b#b75ca3#bd72bf#bd92be#a6be92#9ea771#afaf7e#848467#6f7246#315a08#316101#488e01#48602f#008a86#006663#5c7916#795216#a5933b#99df43#b3da80#dab280#a05207#6a2005#5d311c#9c867b#c69d8f
  operator     = "#fefba4", -- #fef957

  error        = "#ff3333",
  warn         = "#a78d25", -- #ffcc00#
  info         = "#00d5ff",
  hint         = "#7be89b",

  tab_active   = "#1c2842",
  tab_inactive = "#0d1322",
  selection    = "#2a3f66",
  pmenu_sel    = "#00647a",
  search       = "#ff8c00",
}

local hl = vim.api.nvim_set_hl

hl(0, "Normal",        { fg = c.fg, bg = c.bg })
hl(0, "NormalNC",      { fg = c.fg, bg = c.bg })
hl(0, "CursorLine",    { bg = c.cursor_line })
hl(0, "CursorColumn",  { bg = c.cursor_line })
hl(0, "LineNr",        { fg = c.line_nr })
hl(0, "CursorLineNr",  { fg = c.keyword, bold = true })
hl(0, "Visual",        { bg = c.selection })
hl(0, "VisualNOS",     { bg = c.selection })
hl(0, "VertSplit",     { fg = c.border, bg = c.bg })
hl(0, "WinSeparator",  { fg = c.border, bg = c.bg })
hl(0, "Search",        { fg = c.bg, bg = c.search })
hl(0, "IncSearch",     { fg = c.bg, bg = c.search })
hl(0, "CurSearch",     { fg = c.bg, bg = c.search })
hl(0, "Directory",     { fg = c.func, bold = true })
hl(0, "Title",         { fg = c.keyword, bold = true })
hl(0, "NonText",       { fg = c.line_nr })
hl(0, "EndOfBuffer",   { fg = c.bg })

hl(0, "NormalFloat",   { fg = c.fg_float, bg = c.bg_float })
hl(0, "FloatBorder",   { fg = c.border}) -- bg = c.fg_float
hl(0, "FloatTitle",    { fg = c.border, bold = true }) -- bg = c.bg_float,

hl(0, "Pmenu",         { fg = c.fg, bg = c.bg_alt })
hl(0, "PmenuSel",      { fg = c.bg, bg = c.pmenu_sel, bold = true })
hl(0, "PmenuSbar",     { bg = c.bg_alt })
hl(0, "PmenuThumb",    { bg = c.border })

hl(0, "Comment",       { fg = c.comment, italic = true })
hl(0, "SpecialComment",{ fg = c.comment, bold = true })
hl(0, "String",        { fg = c.string })
hl(0, "Character",     { fg = c.string })
hl(0, "Number",        { fg = c.number })
hl(0, "Float",         { fg = c.number })
hl(0, "Boolean",       { fg = c.number, bold = true })
hl(0, "Constant",      { fg = c.constant })

hl(0, "Keyword",       { fg = c.keyword, bold = true })
hl(0, "Statement",     { fg = c.keyword })
hl(0, "Conditional",   { fg = c.keyword })
hl(0, "Repeat",        { fg = c.keyword })
hl(0, "Label",         { fg = c.keyword })
hl(0, "Operator",      { fg = c.operator })
hl(0, "Exception",     { fg = c.error, bold = true })

hl(0, "Function",      { fg = c.func })
hl(0, "Identifier",    { fg = c.variable })
hl(0, "Type",          { fg = c.type, bold = true })
hl(0, "Structure",     { fg = c.type })
hl(0, "StorageClass",  { fg = c.keyword })
hl(0, "TypeDef",       { fg = c.type })

hl(0, "PreProc",       { fg = c.keyword })
hl(0, "Include",       { fg = c.keyword })
hl(0, "Define",        { fg = c.keyword })
hl(0, "Macro",         { fg = c.func })
hl(0, "PreCondit",     { fg = c.keyword })
hl(0, "Special",       { fg = c.operator })
hl(0, "SpecialChar",   { fg = c.operator })
hl(0, "Delimiter",     { fg = c.fg })

hl(0, "@variable",                  { fg = c.variable })
hl(0, "@variable.builtin",          { fg = c.keyword })
hl(0, "@variable.parameter",        { fg = c.fg_alt })
hl(0, "@variable.member",           { fg = c.field })
hl(0, "@property",                  { fg = c.field })
hl(0, "@field",                     { fg = c.field })
hl(0, "@type",                      { fg = c.type })
hl(0, "@type.builtin",              { fg = c.type })
hl(0, "@type.definition",           { fg = c.type })
hl(0, "@type.qualifier",            { fg = c.keyword })
hl(0, "@function",                  { fg = c.func })
hl(0, "@function.builtin",          { fg = c.func })
hl(0, "@function.call",             { fg = c.func })
hl(0, "@function.macro",            { fg = c.func })
hl(0, "@method",                    { fg = c.func })
hl(0, "@method.call",               { fg = c.func })
hl(0, "@constructor",               { fg = c.type })
hl(0, "@keyword",                   { fg = c.keyword })
hl(0, "@keyword.function",          { fg = c.keyword })
hl(0, "@keyword.operator",          { fg = c.operator })
hl(0, "@keyword.return",            { fg = c.keyword, bold = true })
hl(0, "@operator",                  { fg = c.operator })
hl(0, "@punctuation.delimiter",     { fg = c.fg })
hl(0, "@punctuation.bracket",       { fg = c.fg_alt })
hl(0, "@punctuation.special",       { fg = c.operator })
hl(0, "@string",                    { fg = c.string })
hl(0, "@string.escape",             { fg = c.operator })
hl(0, "@string.regex",              { fg = c.string })
hl(0, "@number",                    { fg = c.number })
hl(0, "@boolean",                   { fg = c.number, bold = true })
hl(0, "@constant",                  { fg = c.constant })
hl(0, "@constant.builtin",          { fg = c.constant })
hl(0, "@constant.macro",            { fg = c.constant })
hl(0, "@namespace",                 { fg = c.type })
hl(0, "@module",                    { fg = c.type })
hl(0, "@label",                     { fg = c.keyword })
hl(0, "@comment",                   { fg = c.comment, italic = true })
hl(0, "@tag",                       { fg = c.keyword })
hl(0, "@tag.attribute",             { fg = c.func })
hl(0, "@tag.delimiter",             { fg = c.fg })

hl(0, "DiagnosticError",            { fg = c.error })
hl(0, "DiagnosticWarn",             { fg = c.warn })
hl(0, "DiagnosticInfo",             { fg = c.info })
hl(0, "DiagnosticHint",             { fg = c.hint })
hl(0, "DiagnosticUnderlineError",   { underline = true, sp = c.error })
hl(0, "DiagnosticUnderlineWarn",    { underline = true, sp = c.warn })
hl(0, "DiagnosticUnderlineInfo",    { underline = true, sp = c.info })
hl(0, "DiagnosticUnderlineHint",    { underline = true, sp = c.hint })

hl(0, "BufferCurrent",              { fg = c.fg, bg = c.tab_active, bold = true })
hl(0, "BufferCurrentIndex",         { fg = c.keyword, bg = c.tab_active })
hl(0, "BufferCurrentMod",           { fg = c.warn, bg = c.tab_active })
hl(0, "BufferCurrentSign",          { fg = c.border, bg = c.tab_active })
hl(0, "BufferVisible",              { fg = c.fg_alt, bg = c.tab_inactive })
hl(0, "BufferInactive",             { fg = c.fg_alt, bg = c.tab_inactive })
hl(0, "BufferTabpageFill",          { bg = c.bg_alt })
hl(0, "BufferInactiveSign",         { fg = c.tab_inactive, bg = c.tab_inactive })
hl(0, "BufferInactiveMod",          { fg = c.fg_alt, bg = c.tab_inactive })
hl(0, "BufferInactiveIndex",        { fg = c.fg_alt, bg = c.tab_inactive })

hl(0, "CmpItemAbbr",                { fg = c.fg })
hl(0, "CmpItemAbbrDeprecated",      { fg = c.line_nr, strikethrough = true })
hl(0, "CmpItemAbbrMatch",           { fg = c.keyword, bold = true })
hl(0, "CmpItemAbbrMatchFuzzy",      { fg = c.keyword, bold = true })
hl(0, "CmpItemKind",                { fg = c.type })
hl(0, "CmpItemMenu",                { fg = c.comment })

hl(0, "TelescopeNormal",            { fg = c.fg, bg = c.bg_alt })
hl(0, "TelescopeBorder",            { fg = c.border, bg = c.bg_alt })
hl(0, "TelescopePromptNormal",      { fg = c.fg, bg = c.bg })
hl(0, "TelescopePromptBorder",      { fg = c.border, bg = c.bg })
hl(0, "TelescopePromptTitle",       { fg = c.bg, bg = c.border, bold = true })
hl(0, "TelescopePreviewTitle",      { fg = c.bg, bg = c.type, bold = true })
hl(0, "TelescopeResultsTitle",      { fg = c.bg, bg = c.string, bold = true })
hl(0, "TelescopeSelection",         { bg = c.selection })
hl(0, "TelescopeMatching",          { fg = c.keyword, bold = true })

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "my_theme_1"

local c = {
  bg           = "#001a55", --00174b 2dif L
  bg_alt       = "#0d1322",
  bg_float     = "#00222e",
  fg           = "#bd61ff",
  fg_alt       = "#8683f2",
  border       = "#000000",
  line_nr      = "#3d4b68",
  cursor_line  = "#1a253d",

  comment      = "#3e5e32",
  keyword      = "#3fb7de",
  func         = "#84a4b4", -- d991e3 blancogrisceleste naranjo
  type         = "#9e6182",
  string       = "#4e8923",
  number       = "#f7acf2",
  variable     = "#808080",
  field        = "#e0e7f5",
  constant     = "#9e6182",
  operator     = "#fef957",

  error        = "#ff3333",
  warn         = "#ffcc00",
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

hl(0, "NormalFloat",   { fg = c.border, bg = c.bg_float })
hl(0, "FloatBorder",   { fg = c.border, bg = c.bg_float })
hl(0, "FloatTitle",    { fg = c.border, bg = c.bg_float, bold = true })

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

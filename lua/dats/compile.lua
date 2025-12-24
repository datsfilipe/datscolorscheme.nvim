local M = {}
local u = require 'dats.utils'

function M.generate(palette)
  local c = {
    base = { fg = palette.fg, bg = palette.bg },
    dim = { fg = palette.dim },
    keyword = { fg = palette.keyword },
    def = { fg = palette.definition },
    call = { fg = palette.call },
    value = { fg = palette.value },

    type = { fg = palette.param },
    variable = { fg = palette.variable or palette.fg },

    selection = { bg = palette.selection_bg },
    match = { bg = palette.match_bg, fg = palette.match_fg, bold = true },
    search = { bg = palette.search_bg, fg = palette.search_fg },
    error = { fg = palette.error },
  }

  local groups = {
    Normal = c.base,
    NormalFloat = { fg = palette.fg, bg = palette.float_bg or palette.bg },
    FloatBorder = c.dim,
    Cursor = { fg = palette.bg, bg = palette.fg },
    CursorLine = { bg = palette.line_bg },
    CursorLineNr = { fg = palette.fg, bold = true },
    LineNr = c.dim,
    SignColumn = { bg = palette.bg },
    VertSplit = c.dim,
    WinSeparator = c.dim,
    StatusLine = { fg = palette.fg, bg = palette.line_bg },
    StatusLineNC = { fg = palette.dim, bg = palette.bg },
    Pmenu = { fg = palette.fg, bg = palette.float_bg },
    PmenuSel = c.selection,
    Visual = c.selection,
    Search = c.search,
    IncSearch = c.search,
    MatchParen = c.match,
    Directory = c.keyword,
    ErrorMsg = c.error,
    DiagnosticError = c.error,

    Comment = c.dim,
    Delimiter = c.dim,
    Operator = c.dim,
    Punctuation = c.dim,

    Constant = c.value,
    String = c.value,
    Character = c.value,
    Number = c.value,
    Boolean = c.value,
    Float = c.value,

    Statement = c.keyword,
    Conditional = c.keyword,
    Repeat = c.keyword,
    Label = c.keyword,
    Keyword = c.keyword,
    Exception = c.keyword,
    PreProc = c.keyword,
    Include = c.keyword,
    StorageClass = c.keyword,

    Type = c.type,
    Structure = c.type,
    Typedef = c.type,

    Identifier = c.variable,
    Function = c.def,

    ['@comment'] = { link = 'Comment' },
    ['@punctuation'] = { link = 'Delimiter' },
    ['@punctuation.bracket'] = { link = 'Delimiter' },

    ['@keyword'] = { link = 'Keyword' },
    ['@keyword.function'] = { link = 'Keyword' },
    ['@keyword.return'] = { link = 'Keyword' },
    ['@keyword.coroutine'] = { link = 'Keyword' },

    ['@variable'] = c.variable,
    ['@variable.builtin'] = c.variable,
    ['@variable.member'] = c.variable,
    ['@module'] = c.variable,
    ['@namespace'] = c.variable,

    ['@variable.parameter'] = c.variable,

    ['@function'] = c.def,
    ['@function.call'] = c.call,
    ['@function.builtin'] = c.call,
    ['@method'] = c.def,
    ['@method.call'] = c.call,

    ['@constructor'] = c.type,
    ['@type'] = c.type,
    ['@type.builtin'] = c.type,
    ['@type.definition'] = c.type,

    ['@string'] = { link = 'String' },
    ['@number'] = { link = 'Number' },
    ['@constant'] = { link = 'Constant' },
    ['@constant.builtin'] = { link = 'Constant' },

    ['@tag'] = c.keyword,
    ['@tag.attribute'] = c.variable,
    ['@tag.delimiter'] = c.dim,

    ['@lsp.type.variable'] = { link = '@variable' },
    ['@lsp.type.property'] = { link = '@variable.member' },
    ['@lsp.type.function'] = { link = '@function' },
    ['@lsp.type.method'] = { link = '@method' },
    ['@lsp.type.parameter'] = { link = '@variable.parameter' },
    ['@lsp.type.class'] = { link = '@type' },
    ['@lsp.type.interface'] = { link = '@type' },
  }

  for group, color in pairs(groups) do
    u.highlight(group, color)
  end
end

return M

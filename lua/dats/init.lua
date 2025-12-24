local M = {}
local compile = require 'dats.compile'

M.config = {
  themes = {},
  active_theme = nil,
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend('force', M.config, opts or {})
end

function M.load_theme(theme_name)
  local theme = M.config.themes[theme_name]
  if not theme then
    vim.notify("Dats: Theme '" .. theme_name .. "' not found.", vim.log.levels.ERROR)
    return
  end

  vim.cmd 'hi clear'
  if vim.fn.exists 'syntax_on' then
    vim.cmd 'syntax reset'
  end

  vim.g.colors_name = 'dats'
  vim.o.termguicolors = true

  compile.generate(theme)
end

vim.api.nvim_create_user_command('DatsColorscheme', function(opts)
  M.load_theme(opts.args)
end, {
  nargs = 1,
  complete = function()
    local keys = {}
    for k, _ in pairs(M.config.themes) do
      table.insert(keys, k)
    end
    return keys
  end,
})

return M

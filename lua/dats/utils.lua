local M = {}

function M.highlight(group, color)
  if color.link then
    vim.api.nvim_set_hl(0, group, { link = color.link })
  else
    vim.api.nvim_set_hl(0, group, color)
  end
end

return M

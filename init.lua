local current_dir = vim.fn.getcwd()
vim.opt.rtp:prepend(current_dir)

vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.cursorline = true

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

local dats = require 'dats'

dats.setup {
  themes = {
    ['gruvbox'] = {
      bg = '#1d2021',
      fg = '#ebdbb2',
      line_bg = '#3c3836',
      float_bg = '#504945',
      dim = '#928374',
      keyword = '#fb4934',
      definition = '#83a598',
      call = '#fabd2f',
      value = '#b8bb26',
      variable = '#ebdbb2',
      param = '#d3869b',
      error = '#fb4934',
      selection_bg = '#504945',
      search_bg = '#fabd2f',
      search_fg = '#1d2021',
      match_bg = '#fe8019',
      match_fg = '#1d2021',
    },

    ['vesper'] = {
      bg = '#101010',
      fg = '#E6E6E6',
      line_bg = '#161616',
      float_bg = '#282828',
      dim = '#65737E',
      keyword = '#A0A0A0',
      definition = '#FFCFA8',
      call = '#FFC799',
      value = '#99FFE4',
      variable = '#E6E6E6',
      param = '#A0A0A0',
      error = '#FF8080',
      selection_bg = '#343434',
      search_bg = '#FFC799',
      search_fg = '#101010',
      match_bg = '#FFCFA8',
      match_fg = '#101010',
    },

    ['min-dark'] = {
      bg = '#212121',
      fg = '#c1c1c1',
      line_bg = '#292929',
      float_bg = '#383838',
      dim = '#6b737c',
      keyword = '#ff7a84',
      definition = '#b392f0',
      call = '#79b8ff',
      value = '#ffab70',
      variable = '#c1c1c1',
      param = '#b392f0',
      error = '#cd3131',
      selection_bg = '#444444',
      search_bg = '#cd9731',
      search_fg = '#212121',
      match_bg = '#cd9731',
      match_fg = '#212121',
    },

    ['solarized-dark'] = {
      bg = '#002b36',
      fg = '#839496',
      line_bg = '#073642',
      float_bg = '#073642',
      dim = '#586e75',
      keyword = '#859900',
      definition = '#268bd2',
      call = '#b58900',
      value = '#2aa198',
      variable = '#839496',
      param = '#dc322f',
      error = '#dc322f',
      selection_bg = '#073642',
      search_bg = '#b58900',
      search_fg = '#002b36',
      match_bg = '#cb4b16',
      match_fg = '#fdf6e3',
    },
  },
}

dats.load_theme 'gruvbox'

vim.cmd 'new'
vim.bo.filetype = 'typescript'

local test_code = {
  '// this comment is useful to see the comment highlight',
  'async function calculate(a: number, b: number) {',
  '  const result = a + b;',
  '  if (result > 10) {',
  '    return "High";',
  '  }',
  '  console.log(result);',
  '  // this is a useless comment',
  '  await new Promise(resolve => setTimeout(resolve, 300))',
  '}',
  '',
  'await calculate(5, 15);',
}

vim.api.nvim_buf_set_lines(0, 0, -1, false, test_code)

<div align="center">

# datscolorscheme.nvim

**Semantic, strict, and minimal.**
Start seeing logic.

</div>

### Install & config

```lua
vim.pack.add {
  'https://github.com/datsfilipe/datscolorscheme.nvim',
}

local dats = require('dats')
dats.setup({
  themes = {
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
    }
  }
})

dats.load_theme('vesper')
```

## Commands

- `:DatsTheme <name>` — switch themes instantly.

## License

Refer to [LICENSE](./LICENSE).

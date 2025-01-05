require('lazy').setup({
  'tpope/vim-sleuth',
  { import = 'core.plugins' },
}, {
  ui = {
    icons = {},
  },
})

require('barbar').setup {
  clickable = false,
}

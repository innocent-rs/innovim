require("lazy").setup({
  "tpope/vim-sleuth",
  require("plugins/gitsigns"),
  require("plugins/which-key"),
  require("plugins/telescope"),
  require("plugins/cmp"),
  require("plugins/lsp"),
  require("plugins/conform"),
  require("plugins/treesitter"),
  require("plugins/neo-tree"),
  require("plugins/mini"),
  require("plugins/autopairs"),
  require("plugins/indent_line"),
  require("plugins/todo-comments"),
  require("plugins/theme"),
}, {
  ui = {
    icons = {},
  },
})

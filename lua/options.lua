local opt = vim.opt
local g = vim.g
g.mapleader = ' '
g.maplocalleader = ' '

opt.number = true
-- vim.opt.relativenumber = true

opt.mouse = 'a'
opt.showmode = false

vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)

opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = 'yes'
opt.updatetime = 250
opt.timeoutlen = 300
opt.splitright = true
opt.splitbelow = true
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.inccommand = 'split'
opt.cursorline = true
opt.scrolloff = 10

-- disable nvim intro
opt.shortmess:append 'sI'

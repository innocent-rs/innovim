local map = require('internals.utils').map

map('<leader>y', '"+y', 'copy select into buffer', 'v')
map('<Esc>', '<cmd>nohlsearch<CR>', 'Clear hightlights on search when pressing <Esc> in normal mode')
map('<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')
map('<left>', '<cmd>echo "use h to move!!"<CR>', 'disable left arrow in normal mode')
map('<right>', '<cmd>echo "use l to move!!"<CR>', 'disable right arrow in normal mode')
map('<up>', '<cmd>echo "use k to move!!"<CR>', 'disable up arrow in normal mode')
map('<down>', '<cmd>echo "use j to move!!"<CR>', 'disable down arrow in normal mode')
map('<leader>|', ':vsplit<CR>', 'open a vertical split')
map('<leader>-', ':split<CR>', 'open an horizontal split')

vim.keymap.set('n', 'i', function()
  if #vim.fn.getline '.' == 0 then
    return [["_cc]]
  else
    return 'i'
  end
end, { expr = true, desc = 'properly indent on empty line when insert' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

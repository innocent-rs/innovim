return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released,
    config = function()
      require('barbar').setup {
        animation = true, -- Enable animations
        auto_hide = false, -- Keep tab bar visible always
        tabpages = true, -- Show tab pages indicator
        closable = true, -- Enable close button
        clickable = true, -- Allow tabs to be clickable
        icons = {
          buffer_index = true, -- Show buffer index
          filetype = { enabled = true },
          separator = { left = '▎', right = '' },
          inactive = { separator = { left = '▎', right = '' } },
          modified = { button = '*' },
          pinned = { button = '📌', filename = true },
        },
      }
      local map = require('internals.utils').map
      map('<A-,>', '<cmd>BufferPrevious<CR>', 'go to previous buffer')
      map('<A-.>', '<cmd>BufferNext<CR>', 'go to next buffer')

      -- Re-order to previous/next
      map('<A-<>', '<cmd>BufferMovePrevious<CR>', 'move current buffer to previous')
      map('<A->>', '<cmd>BufferMoveNext<CR>', 'move current buffer to next')
      -- Goto buffer in position...
      map('<A-1>', '<cmd>BufferGoto 1<CR>', 'go to buffer 1')
      map('<A-2>', '<cmd>BufferGoto 2<CR>', 'go to buffer 2')
      map('<A-3>', '<cmd>BufferGoto 3<CR>', 'go to buffer 3')
      map('<A-4>', '<cmd>BufferGoto 4<CR>', 'go to buffer 4')
      map('<A-5>', '<cmd>BufferGoto 5<CR>', 'go to buffer 5')
      map('<A-6>', '<cmd>BufferGoto 6<CR>', 'go to buffer 6')
      map('<A-7>', '<cmd>BufferGoto 7<CR>', 'go to buffer 7')
      map('<A-8>', '<cmd>BufferGoto 8<CR>', 'go to buffer 8')
      map('<A-9>', '<cmd>BufferGoto 9<CR>', 'go to buffer 9')
      map('<A-0>', '<cmd>BufferLast<CR>', 'go to last buffer')

      map('<A-p>', '<cmd>BufferPin<CR>', 'pin or unpin buffer')
      -- Goto pinned/unpinned buffer
      --                 :BufferGotoPinned
      --                 :BufferGotoUnpinned

      map('<A-c>', '<cmd>BufferClose<CR>', 'close buffer')
      -- Wipeout buffer
      --                 :BufferWipeout

      -- Close commands
      --                 :BufferCloseAllButCurrent
      --                 :BufferCloseAllButPinned
      --                 :BufferCloseAllButCurrentOrPinned
      --                 :BufferCloseBuffersLeft
      --                 :BufferCloseBuffersRight

      map('<C-p>', '<cmd>BufferPick<CR>', 'magic buffer-picking mode')
      map('<C-s-p>', '<cmd>BufferPickDelete<CR>', 'magic buffer picking mode delete')

      -- map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
      -- map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
      -- map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
      -- map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
      map('<leader>bb', '<cmd>BufferOrderByBufferNumber<CR>', 'order by buffer bumber')
    end,
  },
}

local M = {}

function M.map(keys, command, desc, mode)
  local opts = { noremap = true, silent = true, desc = desc }
  mode = mode or 'n'

  if type(keys) == 'table' then
    for _, keymap in ipairs(keys) do
      M.map(keymap, command, desc, mode)
    end
    return
  end

  vim.keymap.set(mode, keys, command, opts)
end

return M

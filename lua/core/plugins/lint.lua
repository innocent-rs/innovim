return {
  {
    'esmuellert/nvim-eslint',
  },
  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      local langs = require 'langs'

      lint.linters_by_ft = lint.linters_by_ft or {}

      lint.linters_by_ft['clojure'] = nil
      lint.linters_by_ft['dockerfile'] = nil
      lint.linters_by_ft['inko'] = nil
      lint.linters_by_ft['janet'] = nil
      lint.linters_by_ft['rst'] = nil
      lint.linters_by_ft['ruby'] = nil
      lint.linters_by_ft['terraform'] = nil
      lint.linters_by_ft['text'] = nil

      for _, config in ipairs(langs) do
        if config.linter then
          for _, linter in ipairs(config.linter) do
            for _, ft in ipairs(config.ft) do
              lint.linters_by_ft[ft] = {}
              table.insert(lint.linters_by_ft[ft], linter)
            end
          end
        end
      end
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          if vim.opt_local.modifiable:get() then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}

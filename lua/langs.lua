local M = {
  config = {
    {
      ft = { 'markdown' },
      linter = { 'markdownlint' },
    },
    {
      ft = { 'json' },
      linter = { 'jsonlint' },
    },
    {
      ft = { 'javascript', 'typescript' },
      lsp = { 'ts_ls' },
      formatter = { 'prettierd' },
      linter = { 'eslint' },
    },
    {
      ft = { 'python' },
      lsp = { 'pyright', 'ruff' },
      formatter = { 'ruff' },
      linter = { 'ruff' },
    },
    {
      ft = { 'html' },
      lsp = { 'html', 'emmet-language-server', 'tailwindcss' },
    },
    {
      ft = { 'css' },
      lsp = { 'cssls' },
    },
    {
      ft = { 'javascript', 'typescript' },
      lsp = { 'ts_ls' },
    },
    {
      ft = { 'rust ' },
      lsp = { 'rust_analyzer' },
    },
    {
      ft = { 'nix' },
      lsp = { 'nil_ls' },
    },
    {
      ft = { 'lua' },
      lsp = {
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      },
      formatter = { 'stylua' },
    },
  },
}

M.formatters_by_ft = {}

for _, cfg in ipairs(M.config) do
  if cfg.formatter and #cfg.formatter > 0 then
    for _, ft in ipairs(cfg.ft) do
      M.formatters_by_ft[ft] = cfg.formatter
    end
  end
end

return M

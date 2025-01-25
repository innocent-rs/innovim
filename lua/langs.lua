local M = {
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
}

function M:get_formatters()
  local formatters_by_ft = {}

  for _, cfg in ipairs(M) do
    if cfg.formatter and #cfg.formatter > 0 then
      for _, ft in ipairs(cfg.ft) do
        formatters_by_ft[ft] = cfg.formatter
      end
    end
  end
  return formatters_by_ft
end

return M

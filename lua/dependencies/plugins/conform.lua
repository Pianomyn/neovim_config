
local CONSTANTS = require("constants")

local by_language = {}

for linter, language in pairs(CONSTANTS.REQUIRED_FORMATTERS) do
  if not by_language[language] then
    by_language[language] = {}
  end
  table.insert(by_language[language], linter)
end


require("conform").setup({
  formatters_by_ft = {
    --[[
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { "rustfmt", lsp_format = "fallback" },
    -- Conform will run the first available formatter
    javascript = { "prettierd", "prettier", stop_after_first = true },
    --]]
    --
    lua = by_language["lua"],
    javascript = by_language["javascript"],
    cpp = by_language["cpp"],
    python = by_language["python"],

  },
  format_on_save = {
    lsp_format = "fallback",
    timeout_ms = 500
  }
})

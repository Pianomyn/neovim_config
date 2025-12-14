local CONSTANTS = require("constants")

local by_language = {}

for formatter, language in pairs(CONSTANTS.REQUIRED_FORMATTERS) do
	if not by_language[language] then
		by_language[language] = {}
	end
  if language == "python" and formatter == "ruff" then
    table.insert(by_language[language], "ruff_fix")
    table.insert(by_language[language], "ruff_format")
    table.insert(by_language[language], "ruff_organize_imports")
   else
    table.insert(by_language[language], formatter)
  end
end

require("conform").setup({
	formatters_by_ft = {
		lua = by_language["lua"],
		javascript = by_language["javascript"],
		cpp = by_language["cpp"],
		python = by_language["python"],
	},
	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 500,
	},
})


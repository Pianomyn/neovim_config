local CONSTANTS = require("constants")

local NAME_MAP = {
	ruff = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
}

local by_language = {}

for formatter, language in pairs(CONSTANTS.REQUIRED_FORMATTERS) do
	if not by_language[language] then
		by_language[language] = {}
	end
	if NAME_MAP[formatter] ~= nil then
		for _, mapped_name in ipairs(NAME_MAP[formatter]) do
			table.insert(by_language[language], mapped_name)
		end
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

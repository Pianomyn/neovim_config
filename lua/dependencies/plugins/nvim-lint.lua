local CONSTANTS = require("constants")

local by_language = {}

for linter, language in pairs(CONSTANTS.REQUIRED_LINTERS) do
  if not by_language[language] then
    by_language[language] = {}
  end
  table.insert(by_language[language], linter)
end

require('lint').linters_by_ft = {
  cpp = by_language["cpp"],
  go = by_language["go"],
  python = by_language["python"]
}

vim.api.nvim_create_autocmd({ "TextChangedI" }, {
  callback = function()

    -- try_lint without arguments runs the linters defined in `linters_by_ft`
    -- for the current filetype
    require("lint").try_lint()
  end,
})

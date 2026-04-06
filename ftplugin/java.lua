vim.api.nvim_create_autocmd("java", {
	pattern = { "*.java" },
	callback = function()
		vim.treesitter.start()
	end,
})

local config = {
	cmd = { "/opt/jdtls/bin/jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}
require("jdtls").start_or_attach(config)

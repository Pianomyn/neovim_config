local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local pyproject_path = vim.fn.expand("~/.config/nvim/configs/pyproject.toml")
local stylua_path = vim.fn.expand("~/.config/nvim/configs/stylua.toml")

null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.cpplint,
		null_ls.builtins.diagnostics.flake8,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.autoflake.with({
			extra_args = {
				"--remove-all-unused-imports",
				"--remove-unused-variables",
			},
		}),
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.stylua.with({
			"--config-path",
			stylua_path,
		}),
	},
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(client)
							return client.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
})

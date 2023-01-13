local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local pyproject_path = "~/.config/nvim/configs/pyproject.toml"

null_ls.setup({
    sources = {
      null_ls.builtins.formatting.isort.with({
        extra_args = {
          "--settings-path", pyproject_path
      }
      }),
      null_ls.builtins.formatting.black.with({
        extra_args = {
          "--config", pyproject_path
        }
      }),
      null_ls.builtins.formatting.prettier,
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
                            end
                    })
                end,
            })
        end
    end,
})

local configs = require'nvim-treesitter.configs'
configs.setup {
    ensure_installed = { "python" }, 
    highlight = {
        enable = true,
    },
    indent = { 
        enable = true,
    },
}

local configs = require'nvim-treesitter.configs'
configs.setup {
    ensure_installed = {"python", "javascript", "typescript"}, 
    highlight = {
        enable = true,
    },
    indent = { 
        enable = true,
    },
}

vim.api.nvim_exec(
[[
let g:blamer_delay=100

]],
true

)
vim.go.blamer_delay=100
vim.api.nvim_set_var("blamer_delay", 100)
vim.g.blamer_enabled=1

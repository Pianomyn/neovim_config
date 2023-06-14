-- Show Ripgrep search in fullscreen with preview window at the top
vim.cmd([[
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1,
  \   fzf#vim#with_preview('up', 'ctrl-/'), 1)
]])

-- Show Files search in fullscreen with preview window at the top
vim.cmd([[
 command! -bang -nargs=* Files
   \ call fzf#vim#files(
   \   <q-args>,
   \   fzf#vim#with_preview('up', 'ctrl-/'), 1)
 ]])

-- Make Ripgrep search with custom glob (ex. *.md for md files)
vim.cmd([[
command! -bang -nargs=* RgFileExt call fzf#vim#grep("rg --column --line-number --hidden --smart-case --no-heading --color=always --glob '!**/{.git,node_modules,.idea,.vscode,.history}/**' -g '" . <q-args> . "' ''", 1, <bang>0)
]])

# Plugin Usage
<br/><br/>


## LSP Config
<b>Plug</b>: neovim/nvim-lspconfig <br/>
<b>Usage</b>: Info on installed language servers
- LspInfo (status of language servers)
    - npm i -g pyright
- LspStart [server_name]
<br/><br/>

## LSP Installer
<b>Plug</b>: williamboman/nvim-lsp-installer <br/>
<b>Usage</b>: (Can replace npm i -g)
- LspInstall [--sync] [server_name]
- LspInstallInfo (Bring up UI with list of servers)
    - i: Install
    - u: Update
    - x: Uninstall
<br/><br/>

## LSP Completion
<b>Plug</b>: nvim-lua/completion-nvim <br/>
<b>Usage</b>: Similar to COC auto-complete.
- Copy code from github README.
- Set keymap for next and previous completion suggestion.
<br/><br/>

## LSP Toggle
<b>Plug</b>: WhoIsSethDaniel/toggle-lsp-diagnostics.nvim <br/>
<b>Usage</b>: Toggle diagnostics provided by LSP
- ToggleDiagOne
- ToggleDiagOff
<br/><br/>

## Treesitter
<b>Plug</b>: nvim-treesitter/nvim-treesitter <br/>
<b>Usage</b>: Generates syntax tree for a program based on grammar file of a <br/>
supported language. Can be used for syntax highlighting.
- TSInstall [language_name] (Install grammar file)
- TSModuleInfo: Table of current languages supported and functionality
<br/><br/>

## Git Blame
<b>Plug</b>: APZelos/blamer.nvim <br/>
<b>Usage</b>: Gitlens style git blame 
- BlamerToggle
<br/><br/>


## Other
- Install nerdfonts to get devicons
- Install ripgrep (Used with fzf)
    - sudo apt-get install ripgrep
    - brew install ripgrep 

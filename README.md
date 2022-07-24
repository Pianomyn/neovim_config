# Plugin Usage
<br/><br/>

## LSP Config
Plug: neovim/nvim-lspconfig <br/>
Usage: Info on installed language servers
- LspInfo (status of language servers)
    - npm i -g pyright
- LspStart [server_name]
<br/><br/>

## LSP Installer
Plug: williamboman/nvim-lsp-installer <br/>
Usage: (Can replace npm i -g)
- LspInstall [--sync] [server_name]
- LspInstallInfo (Bring up UI with list of servers)
    - i: Install
    - u: Update
    - x: Uninstall
<br/><br/>

## LSP Completion
Plug: nvim-lua/completion-nvim <br/>
Usage: Similar to COC auto-complete.
- Copy code from github README.
- Set keymap for next and previous completion suggestion.
<br/><br/>

## LSP Toggle
Plug: WhoIsSethDaniel/toggle-lsp-diagnostics.nvim <br/>
Usage: Toggle diagnostics provided by LSP
- ToggleDiagOne
- ToggleDiagOff
<br/><br/>


## Treesitter
Plug: 
Usage: Generates syntax tree for a program based on grammar file of a <br/>
supported language. Can be used for syntax highlighting.
- TSInstall [language_name] (Install grammar file)
- TSModuleInfo: Table of current languages supported and functionality
<br/><br/>

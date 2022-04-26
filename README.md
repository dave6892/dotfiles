dotfiles
============

These are the dotfiles I used for my own terminal-level development environment. These dotfiles are modified from [craftzdog](https://github.com/craftzdog/dotfiles-public).

:warning: **These dot files are intended for my own environment. Use at your own risk.**

## Contents

- vim (NeoVim) config
  - Plugins are managed with [vim-plug](https://github.com/junegunn/vim-plug)
- tmux config
- git config
- fish config


## Vim setup

Requires Neovim (>= 0.5)

- [vim-plug](https://github.com/junegunn/vim-plug) - A minimalist Vim plugin manager
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - A collection of configurations for Neovim's built-in LSP
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - [Treesitter](https://github.com/tree-sitter/tree-sitter) configurations and abstraction layer for Neovim
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion plugin for neovim coded in Lua
- [lspsaga.nvim](https://github.com/tami5/lspsaga.nvim) - A light-weight LSP plugin based on Neovim built-in LSP with highly a performant UI
- [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer) - An LSP server installer
  - It is used for installing an LSP server for Tailwind CSS
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - A highly extendable fuzzy finder over lists
- [defx.nvim](https://github.com/Shougo/defx.nvim) - A file explorer


## Installation

Run the `bootstrap.sh` script

```sh
./bootstrap.sh
```

## Resources

* [craftzdog](https://github.com/craftzdog/) or [devaslife](https://www.youtube.com/c/devaslife) on YouTube: inspired this environment setup.
* [dev-setup](https://github.com/dave6892/dev-setup/tree/develop): Checkout my software setup suite. (Private for now).
* `dev-setup` is inspired by [donnemartin](https://github.com/donnemartin/dev-setup)'s repo.

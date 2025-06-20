# dotfiles

A modern, flexible dotfiles configuration that works seamlessly across Bash, Zsh, and Fish shells. These dotfiles provide a consistent development environment regardless of which shell you prefer to use.

> :warning: **These dotfiles are intended for my own environment. Use at your own risk.**

Originally inspired by [craftzdog](https://github.com/craftzdog/dotfiles-public), this repository has evolved to support a shell-agnostic approach to configuration.

## Features

- **Multi-shell compatibility**: Works with Bash, Zsh, and Fish shells
- **Shared configuration**: Core settings are defined once and applied across all shells
- **Modern development tools**: Support for Neovim, tmux, git, and more
- **Modular structure**: Easy to understand, maintain, and customize
- **Local customization**: Simple way to add machine-specific configurations

## Directory Structure

```
dotfiles/
├── .shell/                  # Shell-agnostic configurations
│   ├── aliases.sh           # Common aliases for all shells
│   ├── exports.sh           # Environment variables
│   ├── functions.sh         # Utility functions
│   └── path.sh              # PATH configuration
│
├── .config/                 # XDG config directory
│   └── fish/                # Fish shell configuration
│       ├── config.fish      # Main fish configuration
│       ├── config-macos.fish # macOS-specific fish settings
│       └── functions/       # Fish functions
│           ├── load_aliases.fish    # Loads shared aliases in fish
│           ├── load_functions.fish  # Implements shared functions in fish
│           └── source_shell_config.fish # Imports shared env vars
│
├── .bashrc                  # Bash configuration
├── .zshrc                   # Zsh configuration
├── .gitconfig               # Git configuration
├── .tmux.conf               # Tmux configuration
└── bootstrap.sh             # Installation script
```

## How It Works

The core concept is simple: define configurations once and use them everywhere.

1. **Shell-agnostic configs** in `.shell/` are written in POSIX shell syntax
2. **Bash and Zsh** source these files directly
3. **Fish shell** uses wrapper functions to convert these configs to fish syntax

This approach means you can switch between shells without losing your customizations or having to maintain multiple configurations.

## Installation

Run the `bootstrap.sh` script to install the dotfiles:

```sh
./bootstrap.sh
```

Or use the `--force` option to skip the confirmation prompt:

```sh
./bootstrap.sh --force
```

The script will:
1. Create necessary directories
2. Copy all files to your home directory
3. Set correct permissions for executable files

After installation, you can immediately start using any of the supported shells with your new configuration.

## Customization

### Local Configurations

Add machine-specific settings without modifying the main configuration:

- Bash: Create `~/.bashrc.local`
- Zsh: Create `~/.zshrc.local`
- Fish: Create `~/.config/fish/config-local.fish`

These files are automatically sourced if they exist.

### Adding New Aliases or Functions

To add new aliases or functions that work across all shells:

1. Add them to the appropriate file in `.shell/` directory
2. They'll be automatically loaded in all supported shells

### Shell-Specific Customizations

For shell-specific features that can't be shared:

- Bash/Zsh: Add directly to `.bashrc` or `.zshrc` 
- Fish: Add to `~/.config/fish/config.fish` or create new functions in `~/.config/fish/functions/`

## Vim Setup

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

## Other Tools

### Tmux Configuration

- Modern terminal multiplexer setup with sensible defaults
- Mouse support and improved key bindings
- Seamless navigation between tmux panes and vim splits

### Git Configuration

- Useful aliases for common git operations
- Enhanced diff and log visualization
- Sensible defaults for better usability

## Resources

* [craftzdog](https://github.com/craftzdog/) or [devaslife](https://www.youtube.com/c/devaslife) on YouTube: inspired the original environment setup.
* [dev-setup](https://github.com/dave6892/dev-setup/tree/develop): Check out my software setup suite. (Private for now).
* `dev-setup` is inspired by [donnemartin](https://github.com/donnemartin/dev-setup)'s repo.

## License

This project is licensed under MIT License - see the LICENSE file for details.

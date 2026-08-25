# Neovim Config

Personal Neovim configuration using Packer as plugin manager.

## Prerequisites

Install the following tools before setting up Neovim:

### Core

- **Neovim** >= 0.10
- **git**
- **A Nerd Font** — for icons to render correctly in the terminal

### Telescope (fuzzy finder)

```sh
brew install ripgrep fd
```

### Treesitter

```sh
brew install tree-sitter
```

### Language Servers

#### Lua

```sh
brew install lua-language-server
```

#### Python

```sh
pip install python-lsp-server
```

#### YAML

```sh
pnpm add -g yaml-language-server
```

#### Ruby

```sh
gem install solargraph
```

#### Rust

```sh
rustup component add rust-analyzer
```

### Lazygit

```sh
brew install lazygit
```

## Installation

### 1. Clone this repo

```sh
git clone <your-repo-url> ~/.config/nvim
```

### 2. Install Packer

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### 3. Install plugins

Open Neovim — you will see errors on the first launch, that's expected since plugins aren't installed yet. Run:

```
:luafile lua/glankenau/packer.lua
:PackerSync
```

Wait for all plugins to finish installing, then restart Neovim.

### 4. Install Treesitter parsers

After restarting, the parsers configured in `after/plugin/treesitter.lua` will install automatically on first open of a relevant file. You can also trigger it manually:

```
:TSUpdate
```

## Keymaps

`<leader>` is `Space`.

### Harpoon

| Key | Action |
|-----|--------|
| `<leader>a` | Add current file to Harpoon list |
| `<C-e>` | Toggle quick menu |
| `<C-h>` | Jump to file 1 |
| `<C-t>` | Jump to file 2 |
| `<C-n>` | Jump to file 3 |
| `<C-s>` | Jump to file 4 |
| `<C-S-P>` (Ctrl+Shift+P) | Go to previous file in list |
| `<C-S-N>` (Ctrl+Shift+N) | Go to next file in list |

### Lazygit

| Key | Action |
|-----|--------|
| `<leader>lg` | Toggle Lazygit |

## Verifying LSP

Open a file of the relevant type and run:

```
:lua vim.print(vim.lsp.get_clients())
```

This lists the active LSP clients for the current buffer.

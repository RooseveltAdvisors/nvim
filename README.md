# Neovim Configuration

This is a modern Neovim configuration focused on providing a powerful and efficient development environment. The configuration is organized using Lua and includes various plugins managed by the Lazy plugin manager.

> **Credit**: This configuration is based on the work of [@BlindGarret](https://github.com/BlindGarret). All credit goes to him for creating this excellent Neovim setup.

## Core Features

### Basic Settings

- Line numbers enabled
- Mouse support in all modes
- Smart case-sensitive search
- Soft wrapping with proper indentation
- 2-space indentation by default
- Code folding with TreeSitter integration

### Key Bindings

#### General Editor Commands

| Shortcut | Mode | Description |
|----------|------|-------------|
| `>` | Visual | Indent selection |
| `<` | Visual | Unindent selection |
| `Alt + ↑` | Normal/Insert | Move current line up |
| `Alt + ↓` | Normal/Insert | Move current line down |
| `Ctrl + D` | Normal/Insert | Delete current line |
| `Ctrl + S` | Insert | Save file |
| `F2` | Normal/Insert | Toggle file explorer (NvimTree) |

#### Search and Navigation

| Shortcut | Mode | Description |
|----------|------|-------------|
| `Ctrl + F` | Normal | Search in files (live grep) |
| `Ctrl + F Ctrl + F` | Normal | Find files |
| `z↑` | Normal | Go to previous fold |
| `z↓` | Normal | Go to next fold |
| `ee` | Normal | Show diagnostic float |

#### LSP (Language Server Protocol) Features

| Shortcut | Mode | Description |
|----------|------|-------------|
| `Ctrl + Space` | Insert | Trigger code completion |
| `F1` | Normal | Show hover documentation |
| `Alt + ]` | Normal | Show references |
| `Ctrl + R` | Normal/Insert | Rename symbol |
| `F4` | Normal | Show code actions |

#### Terminal

| Shortcut | Mode | Description |
|----------|------|-------------|
| `Esc` | Terminal | Exit terminal mode |

## Installed Plugins

The configuration includes several carefully selected plugins to enhance the development experience:

- **Telescope**: Fuzzy finder for files, buffers, and more
- **Treesitter**: Advanced syntax highlighting and code navigation
- **NvimTree**: File explorer with git integration
- **Lualine**: Statusline with useful information
- **Delve**: Debugger integration for Go
- **Copilot**: GitHub Copilot integration
- **Comments**: Easy code commenting
- **Conform**: Code formatting
- **Coverage**: Code coverage visualization
- **Theme**: Color scheme and visual customization

## Plugin Management

This configuration uses the Lazy plugin manager for efficient plugin management. Plugins are loaded lazily to ensure fast startup times. The space key (`<Space>`) is configured as the leader key for plugin commands.

## File Structure

```
.
├── init.lua              # Main configuration entry point
└── lua/
    ├── core/            # Core configuration files
    │   ├── options.lua  # Basic Neovim options
    │   ├── keymaps.lua  # Key mappings
    │   ├── lsp.lua      # LSP configuration
    │   └── format-on-save.lua # Auto-formatting settings
    ├── plugins/         # Plugin configurations
    └── lazy-setup.lua   # Plugin manager setup
```

## Getting Started

1. Clone this repository to your Neovim configuration directory:
   ```bash
   git clone https://github.com/BlindGarret/nvim.git ~/.config/nvim
   ```

2. Start Neovim - the configuration will automatically:
   - Set up the Lazy plugin manager
   - Install configured plugins
   - Configure LSP servers
   - Apply all settings and keymaps

## Customization

To customize this configuration:

1. Modify `lua/core/options.lua` for basic Neovim settings
2. Edit `lua/core/keymaps.lua` to change key bindings
3. Update plugin configurations in the `lua/plugins/` directory
4. Adjust LSP settings in `lua/core/lsp.lua`

## Requirements

- Neovim >= 0.8.0
- Git (for plugin management)
- A Nerd Font (for icons)
- Ripgrep (`brew install ripgrep`) - Required for Telescope's live grep functionality
- Various language servers for LSP features

## Installation

1. Install the required dependencies:
   ```bash
   # On macOS using Homebrew
   brew install neovim ripgrep git
   ```

2. Clone this repository to your Neovim configuration directory:
   ```bash
   git clone https://github.com/BlindGarret/nvim.git ~/.config/nvim
   ```

3. Start Neovim - the configuration will automatically:
   - Set up the Lazy plugin manager
   - Install configured plugins
   - Configure LSP servers
   - Apply all settings and keymaps 
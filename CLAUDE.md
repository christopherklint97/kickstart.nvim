# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). It uses **lazy.nvim** as the plugin manager. The active colorscheme is **Dracula** (dark).

## Formatting

Lua files are formatted with **StyLua**. Run: `stylua .`

Config: `.stylua.toml` — 160 column width, 2-space indentation, single quotes preferred, no call parentheses.

## Architecture

### Entry point

`init.lua` — single monolithic file containing:
- Vim options and basic keymaps (leader is `<Space>`)
- lazy.nvim bootstrap and plugin setup (all core plugins configured inline)
- LSP configuration via Mason with auto-install of language servers
- Telescope, nvim-cmp, Treesitter, conform.nvim (autoformat) configs
- At the bottom: requires custom mapping modules

### Custom modules (the files you'll most often edit)

**`lua/custom/plugins/*.lua`** — Each file returns a lazy.nvim plugin spec. All files in this directory are auto-imported via `{ import = 'custom.plugins' }` in init.lua. To add a new plugin, create a new file here.

**`lua/custom/mappings/*.lua`** — Keybinding modules, explicitly required at the end of init.lua. To add a new mapping module, create the file AND add a `require` line in init.lua.

### Filetype-specific config

**`ftplugin/*.lua`** — Per-language settings loaded automatically by Neovim:
- `go.lua`: tabs, 4-width indent, dap-go test debugging (`<Space>td`)
- `java.lua`: JDTLS setup via Mason binary
- `javascript.lua`, `typescript.lua`, `json.lua`: 2-space indent
- `sql.lua`: SQL comment string

### Kickstart modules

**`lua/kickstart/plugins/*.lua`** — Upstream kickstart plugin configs (debug, indent_line, lint, autopairs, neo-tree, gitsigns). These are required in init.lua's lazy.setup call.

## Key conventions

- **LSP servers**: Defined in the `servers` table inside init.lua's `nvim-lspconfig` config block. Mason auto-installs them. JDTLS is excluded from the default handler — it's configured separately in `ftplugin/java.lua`.
- **Formatting**: conform.nvim runs on save. Formatters defined per filetype in init.lua (`formatters_by_ft`). Lua uses `stylua`; JS/TS uses `prettierd`/`prettier`.
- **Linting**: nvim-lint runs on `BufEnter`, `BufWritePost`, `InsertLeave`. Linter config is in `lua/kickstart/plugins/lint.lua` (currently empty `linters_by_ft`).
- **Plugin lock file**: `lazy-lock.json` is tracked in git but listed in `.gitignore` — check the actual gitignore behavior if modifying dependencies.

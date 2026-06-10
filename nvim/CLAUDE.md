# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with
code in this repository.

## Overview

This is a Neovim configuration built on **LazyVim** with **lazy.nvim** as the
plugin manager. It is organized into discrete Lua modules under `lua/config/`
and `lua/plugins/`.

## Code Style

Lua formatting is enforced via **StyLua** (`stylua.toml`): 4-space indentation,
120-column line width. Run before committing:

```sh
stylua lua/
```

## Architecture

### Load Order

`init.lua` bootstraps everything in strict order:

1. Disables netrw, sets `<Space>` as leader
2. Requires `config/lazy` (lazy.nvim bootstrap + plugin specs)
3. Requires `config/lazy_opts` (LazyVim framework options)
4. Requires `config/lazy_maps` (LazyVim default keymaps)
5. Requires `config/keymaps` (custom user keymaps)
6. Requires `config/options` (custom Neovim options)
7. Requires `config/autocmds` (autocommands)

### Directory Structure

```
lua/
├── config/
│   ├── lazy.lua        # lazy.nvim bootstrap; loads plugins/ and plugins/lsp/
│   ├── lazy_opts.lua   # LazyVim global options (completion=blink, picker=telescope)
│   ├── lazy_maps.lua   # LazyVim base keymaps (window nav, buffers, git, toggles)
│   ├── options.lua     # Neovim options (updatetime=50, shiftwidth=4, no swapfile)
│   ├── keymaps.lua     # User keymaps (Mac Cmd keys, Telescope, Harpoon, C++ runner)
│   └── autocmds.lua    # Autocommands (colorscheme, format-on-save, session save)
└── plugins/
    ├── lsp/
    │   ├── lspconfig.lua  # Server configs: clangd, ts_ls, pyright, rust_analyzer, lua_ls, emmet_ls, sqlls
    │   └── mason.lua      # Mason installer
    └── *.lua              # One file per plugin or plugin group
snippets/                  # LuaSnip-compatible JSON snippets (cpp, python, js, lua, c)
```

### Key Architectural Decisions

- **Plugin specs live in `lua/plugins/`** — each file returns a lazy.nvim spec
  table. Adding a new plugin = adding a new file here.
- **LSP servers are configured in `lua/plugins/lsp/lspconfig.lua`** with a
  shared `on_attach` that sets keymaps and triggers format-on-save (except Rust,
  which uses RustFmt).
- **Completion** uses `blink.cmp` (Tab to accept, fuzzy matching).
- **Formatter** uses `conform.nvim` (prettier for markdown); LSP format-on-save
  for other filetypes.
- **Active colorscheme** is set in `autocmds.lua`
  (`vim.cmd("colorscheme ayu")`), not in the plugin spec — change it there.
- **Session management** uses `mini.sessions`; auto-saves to "autosave" on
  `VimLeavePre`.
- **Mac-specific keybinds** use hex escape codes (`\27[1;69D` etc.) for Cmd+key
  combinations in `keymaps.lua`.

### Configured LSP Servers

| Server        | Language                                     |
| ------------- | -------------------------------------------- |
| clangd        | C/C++ (C++23, `/opt/homebrew/opt/llvm/bin/`) |
| ts_ls         | TypeScript / JavaScript                      |
| pyright       | Python                                       |
| rust_analyzer | Rust (clippy, all features)                  |
| lua_ls        | Lua                                          |
| emmet_ls      | HTML / CSS                                   |
| sqlls         | SQL (MySQL)                                  |

### Notable Plugins

- **Snacks.nvim** — dashboard, explorer (`<leader>e`), lazygit (`<leader>gg`),
  notifications, picker
- **Telescope** — fuzzy finder (`<leader><space>` files, `<leader>/` grep)
- **Harpoon** — file marks (`<leader>hm/hf/hp/ha`)
- **Flash.nvim** — motion (`s`, `S`)
- **DAP + DAP-UI** — C/C++ debugger via LLDB (`<F1>`–`<F5>`, `<leader>db`)
- **CompetiTest** — competitive programming test runner (`<leader>a*`)
- **Oil.nvim** — file manager (opens when nvim is invoked with `.`)
- **mini.nvim** — surround, pairs, ai text objects, snippets, indentscope
- **Trouble.nvim** — diagnostics panel (`<leader>xx`)

### Competitive Programming Setup

`<leader>rr` compiles and runs the current C++ file with `g++-14`, reading from
`input.txt` and writing to `output.txt`. CompetiTest (`<leader>a*`) provides
test-case management and contest reception.

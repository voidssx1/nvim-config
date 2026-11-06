# nvim-config

Modular Neovim setup using lazy.nvim and the Oxocarbon colorscheme.

## Neovim

Leader key: `<Space>`

| Shortcut | Action |
| --- | --- |
| `<Esc>` | Clear search highlight |
| `<Space>w` | Save file |
| `<Space>q` | Quit window |
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | Move between windows |
| `<Space>th` | Open a horizontal terminal |
| `<Space>tv` | Open a vertical terminal |
| `<Esc><Esc>` in terminal mode | Return to normal mode |

## Oil.nvim

| Shortcut | Action |
| --- | --- |
| `<Space>e` | Open file browser |
| `<CR>` | Open file or directory |
| `-` | Go to parent directory |
| `_` | Open current working directory |
| `q` | Close file browser |

## Telescope.nvim

| Shortcut | Action |
| --- | --- |
| `<Space>ff` | Find files |
| `<Space>fg` | Search project text |
| `<Space>fb` | Find open buffers |
| `<Space>fr` | Find recent files |

## nvim-cmp

| Shortcut | Action |
| --- | --- |
| `<C-Space>` | Open completion menu |
| `<CR>` | Confirm selected completion |
| `<Tab>` | Select next completion or jump forward in snippet |
| `<S-Tab>` | Select previous completion or jump backward in snippet |

## nvim-lspconfig

| Shortcut | Action |
| --- | --- |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Find references |
| `gi` | Go to implementation |
| `K` | Show hover documentation |
| `<Space>rn` | Rename symbol |
| `<Space>ca` | Show code actions |
| `<Space>d` | Show diagnostic details |
| `[d` / `]d` | Previous / next diagnostic |

## conform.nvim

| Shortcut | Action |
| --- | --- |
| `<Space>f` | Format current buffer |

## neoscroll.nvim

| Shortcut | Action |
| --- | --- |
| `<C-d>` / `<C-u>` | Smooth half-page down / up |
| `<C-f>` / `<C-b>` | Smooth full-page down / up |
| `<C-e>` / `<C-y>` | Smooth small scroll down / up |
| Mouse wheel down / up | Smooth three-line scroll |
| `zt` / `zz` / `zb` | Smoothly move cursor line to top / center / bottom |

## Comment.nvim

| Shortcut | Action |
| --- | --- |
| `gcc` | Toggle comment on current line |
| `gc` followed by a motion | Toggle line comments over the motion |
| `gbc` | Toggle block comment on current line |
| `gb` followed by a motion | Toggle block comments over the motion |

## lazy.nvim

| Shortcut | Action |
| --- | --- |
| `<Space>lg` | Open plugin manager |

## which-key.nvim

Press `<Space>` and pause to see available leader-key shortcuts.

## Language tools

- Python: Python 3, Pyright, Ruff
- C and C++: GCC/G++, Clangd, Clang Format, CMake, Ninja, GDB
- Go: Go, gopls, golangci-lint
- Rust: Rustc, Cargo, rust-analyzer, rustfmt, Clippy
- JavaScript and TypeScript: TypeScript Language Server (ts_ls), Prettier, Node.js
- Lua: lua-language-server

Tree-sitter parsers provide syntax highlighting. Run `:Lazy` to manage plugins.

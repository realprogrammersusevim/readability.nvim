# readability.nvim | Beta

Have you ever been writing when you suddenly noticed that your prose doth
eloquently wax too verbose? Fear not, for this NeoVim plugin analyzes your
writing and provides a readability score so you know exactly what kind of
audience your writing is targeting.

## Requirements

- NeoVim >= newish

## Installation

Install this NeoVim plugin using your favorite package manager.

**Vim-Plug**

```vim
Plug 'realprogrammersusevim/readability.nvim'
```

And then restart and run `:PlugInstall`.

**Packer**

```lua
use 'realprogrammersusevim/readability.nvim'
```

Then restart and run `:PackerInstall`.

## Usage

Currently, this plugin only provides a single command, `:Readability`, which
calculates the SMOG index of the current buffer.

## TODO

- [x] Write a sentence parser in Lua
- [x] Write a word syllable counter
- [ ] Add more readability metrics
- [ ] Improve syllable counter
- [ ] Write documentation

# readability.nvim | βήτα

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

This plugin provides two commands:

1. `:ReadabilitySmog` which calculates the SMOG index of your writing
2. `:ReadabilityFlesch` which calculates the Flesch-Kincaid grade level of your
   writing

## TODO

- [x] Write a sentence parser in Lua
- [x] Write a word syllable counter
- [x] Add more readability metrics
- [ ] Improve syllable counter
- [ ] Write documentation

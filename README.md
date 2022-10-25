# readability.nvim | Alpha

Quickly calculate the readability of your prose. Currently in alpha stage. I haven't written the sentence and syllable parsers yet so for now it just relies on the `style` command. Don't worry, it'll soon be pure Lua.

## Requirements

- NeoVim >= newish
- Style command

## Installation

Install `style` with your package manager (don't worry, you won't have to do this soon).

Install this NeoVim plugin using your favorite package manager.

**Vim-Plug**

```vim
Plug 'realprogrammersusevim/readability.nvim'
```

And then restart and `:PlugInstall`.

**Packer**

```lua
use 'realprogrammersusevim/readability.nvim'
```

Then restart and run `:PackerInstall`.

## TODO

- [ ] Write a sentence parser in Lua. The regular expressions will be complex enough that I'll have to get put the lrexlib Lua library in a dependencies folder. I found a parser [here.](https://github.com/pncnmnp/LuaNLP/blob/main/tokenizer/tokenization.lua)
- [ ] Write a word syllable counter. Use the rules described [here.](https://www.howmanysyllables.com/syllable_rules/howtocountsyllables) For the first version just hard code "y" as either a vowel or consonant, depending on which is more common. Eventually write some rules to figure out that tricky "y".

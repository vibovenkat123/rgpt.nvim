<h3 align="center">
  <img src="https://raw.githubusercontent.com/vibovenkat123/review-gpt/main/assets/logo/logo.png" width="200"/>
  <h1 align="center"> Review-GPT Neovim </h1>
</h3>


Bring the review-gpt experience a brilliant editor

## Requirements

* [review-gpt](https://github.com/vibovenkat123/review-gpt)

* [git](https://git-scm.com)

* [neovim](https://neovim.io)

# Usage

> With [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
-- plugins above
"vibovenkat123/rgpt.nvim"
-- plugins below
```
> With [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
-- plugins above
use "vibovenkat123/rgpt.nvim"
-- plugins below
```

> Usage

## Example:

![Example of the usage](/assets/examples/usage/usage.png)

In a file, do:

```vim
:ReviewGPT review
```

You can set keymaps for it too.

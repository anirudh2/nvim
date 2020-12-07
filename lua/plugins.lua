-- Defines the plugins that neovim uses. Plugins managed by packer
-- https://github.com/wbthomason/packer.nvim
-- Remember that plugins marked as optional must be added when we want to use
-- them using packadd <plugin>

-- Include Packer from opt path
vim.cmd [[packadd packer.nvim]]
vim.cmd [[packadd nvim-treesitter]]

return require("packer").startup(function()
  -- Packer manages itself
  use {"wbthomason/packer.nvim", opt = true }

  -- Tags
  use { "ludovicchabant/vim-gutentags" }
  use { "preservim/tagbar" }

  -- Text-style documents
  use { "reedes/vim-wordy", ft = { "latex", "text", "markdown" }}

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", event = "VimEnter *",
    config = function() require "treesitter" end }

  -- Color schemes
  use { "norcalli/nvim-colorizer.lua" }  -- Colorizer to visual hex colours in terminal
  use { "christianchiarulli/nvcode-color-schemes.vim" }

  -- Airline
  use { "vim-airline/vim-airline" }
  use { "vim-airline/vim-airline-themes" }
end)

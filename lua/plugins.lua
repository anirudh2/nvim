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

  -- Git
  use { "tpope/vim-fugitive" }

  -- Icons
  use { "ryanoasis/vim-devicons" }

  -- NERDTree
  use { "preservim/nerdtree" }
  use { "Xuyuanp/nerdtree-git-plugin" }

  -- Autocomplete
  use {
    "nvim-lua/completion-nvim",
    { "neovim/nvim-lspconfig", config = function() require "lsp_local".configure_lsp() end },
  }
  use { "nvim-treesitter/completion-treesitter" }


  -- TeX
  use { "lervag/vimtex" }

  -- Commenting
  use { "tpope/vim-commentary" }

  -- Snippets
  use { "SirVer/ultisnips" }

end)

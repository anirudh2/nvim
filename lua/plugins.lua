-- Defines the plugins that neovim uses. Plugins managed by packer
-- https://github.com/wbthomason/packer.nvim

-- Include Packer from opt path
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
    -- Packer manages itself
    use {"wbthomason/packer.nvim", opt = true }
end)

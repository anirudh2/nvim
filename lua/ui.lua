-- Defines the aesthetics of the neovim session

-- Numbering
vim.wo.number = true
vim.wo.relativenumber = true

-- Add nvcode colorscheme
vim.api.nvim_command( "let g:nvcode_termcolors=256" )
vim.api.nvim_command( "syntax on" )
vim.api.nvim_command( "colorscheme onedark" )
vim.api.nvim_command( "set termguicolors" )

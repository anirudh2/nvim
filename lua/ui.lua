-- Defines the aesthetics of the neovim session

-- Numbering
vim.wo.number = true
vim.wo.relativenumber = true

-- Add nvcode colorscheme
vim.api.nvim_command( "let g:nvcode_termcolors=256" )
vim.api.nvim_command( "syntax on" )
vim.api.nvim_command( "colorscheme onedark" )
vim.api.nvim_command( "set termguicolors" )

-- Powerline
vim.api.nvim_command( "let g:airline_powerline_fonts = 1" )
vim.api.nvim_command( "let g:Powerline_symbols='fancy'" )
vim.api.nvim_command( "let g:airline_theme='onedark'" )

-- Defines the aesthetics of the neovim session

-- Numbering
vim.wo.number = true
vim.wo.relativenumber = true

vim.api.nvim_command("highlight ColorColumn ctermbg=17")

-- Default colour columns
vim.api.nvim_command("let &colorcolumn=\"80,\".join(range(80,999), \",\")")

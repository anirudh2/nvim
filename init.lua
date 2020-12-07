require "ui"
require "filetypes"
require "plugins"

-- Mapping
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "kk", "<Esc>", { noremap = true })

-- Tabs
vim.api.nvim_buf_set_option(0, "expandtab", true)
vim.api.nvim_buf_set_option(0, "shiftwidth", 4)
vim.api.nvim_buf_set_option(0, "autoindent", true)

-- Leader
vim.g.mapleader = ";"

-- Colorizer
require "colorizer".setup()

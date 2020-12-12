require "plugins"
require "filetypes"
require "ui"

-- Mapping
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "kk", "<Esc>", { noremap = true })

-- Leader
vim.g.mapleader = ";"

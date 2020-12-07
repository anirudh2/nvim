local ts = require "nvim-treesitter.configs"

ts.setup {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "lua",
    "python",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}

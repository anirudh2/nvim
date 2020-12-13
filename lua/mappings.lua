require "utils"

-- Leader
vim.g.mapleader = ";"

local mappings = {
  -- Mapping jj and kk to Esc
  ["ijj"] = { "<Esc>", noremap = true; };
  ["ikk"] = { "<Esc>", noremap = true; };

  -- Quickjump
  ["n<leader><leader>"] = { "/<++><Enter>:noh<Enter>cf>" };

  -- Navigating autocomplete
  ["i<Space>"] = { 'pumvisible() ? "\\<c-y>" : "\\<Space>"', expr=true; noremap=false; silent=false };  -- Space -> Enter
  ["i<S-Tab>"] = { 'pumvisible() ? "\\<c-p>" : "\\<S-Tab>"', expr=true; noremap=false; silent=false };  -- Shift-tab -> Up
  ["i<Tab>"] = { 'pumvisible() ? "\\<c-n>" : "\\<Tab>"', expr=true; noremap=false; silent=false };  -- Tab -> Down
}

nvim_mappings(mappings, { silent = true; })

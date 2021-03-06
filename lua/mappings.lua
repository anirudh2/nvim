require "utils"

-- Leader
vim.g.mapleader = ";"

local mappings = {
  -- Mapping jj and kk to Esc
  ["ijj"] = { "<Esc>", noremap = true; };
  ["ikk"] = { "<Esc>", noremap = true; };

  -- Quickjump
  ["n<leader><leader>"] = { "/<++><Enter>:noh<CR>cf>" };  -- Leader Leader -> Find and replace next <++>

  -- Remove Highlighting
  ["n<leader>nh"] = { ":noh<CR>" };  -- Leader nh -> remove highlighting

  -- Autocomplete
  ["i<M-k>"] = { 'pumvisible() ? "\\<c-p>" : "\\<M-k>"', expr=true; noremap=false; silent=false };  -- Alt-k -> Up
  ["i<M-j>"] = { 'pumvisible() ? "\\<c-n>" : "\\<M-j>"', expr=true; noremap=false; silent=false };  -- Alt-j -> Down
  ["n<F2>"] = { ":CompletionToggle<CR>" };  -- Toggle Autocomplete
  ["i<F2>"] = { "<Esc>:CompletionToggle<CR>a" };  -- Toggle Autocomplete

  -- Tagbar
  ["n<leader>tb"] = { ":TagbarToggle<CR>" };  -- Leader tb -> TagbarToggle
  ["i<leader>tb"] = { "<Esc>:TagbarToggle<CR>a" };  -- Leader tb -> TagbarToggle

  -- Wordy
  ["n<leader>nw"] = { ":NextWordy<CR>" };  -- Leader nw -> NextWordy
  ["n<leader>pw"] = { ":PrevWordy<CR>" };  -- Leader pw -> PrevWordy

  -- NERDTree
  ["n<leader>nt"] = { ":NERDTreeToggle<CR>" };  -- Leader nt -> Toggle NERDTree
  ["i<leader>nt"] = { "<Esc>:NERDTreeToggle<CR>a" };  -- Leader nt -> Toggle NERDTree

  -- Remove whitespace
  ["n<leader>w"] = { ":let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar><CR>" };

  -- Vimtex
  ["n<leader>toc"] = { ":VimtexTocToggle<CR>" };
  ["n<leader>ll"] = { ":VimtexCompile<CR>" };
  ["n<leader>lv"] = { ":VimtexView<CR>" };
}

nvim_mappings(mappings, { silent = true; })

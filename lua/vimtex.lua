-- From https://github.com/nvim-lua/completion-nvim/wiki/custom-completion-source#create-completion-source-with-omni-func


local M = {}

function M.getCompletionItems(prefix)
  local items = vim.api.nvim_call_function("vimtex#complete#omnifunc", { 0, prefix })
  return items
end


M.complete_items = {
  item = M.getCompletionItems
}

return M

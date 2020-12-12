-- From https://github.com/nvim-lua/completion-nvim/wiki/custom-completion-source#create-completion-source-with-omni-func

-- Completion Chain
require"completion".addCompletionSource("vimtex", require"vimtex".complete_item)

vim.api.nvim_command( "let g:completion_chain_complete_list = { 'tex' : [{'complete_items': ['vimtex', 'lsp']}] }" )

-- Auto switch completion sources
vim.api.nvim_command( "let g:completion_auto_change_source = 1" )

-- Ensure that we're using TeX rather than PlainTeX
vim.api.nvim_command( "let g:tex_flavor='latex'" )

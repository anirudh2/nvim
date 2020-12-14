-- Managing snippets
vim.api.nvim_command( "let g:completion_enable_snippet='UltiSnips'" )
vim.api.nvim_command( "let g:UltiSnipsExpandTrigger='<M-Tab>'" )  -- Alt+Tab for completing snippet
vim.api.nvim_command( "let g:UltiSnipsJumpForwardTrigger='<M-Tab>'" )  -- Alt+Tab for next placeholder
vim.api.nvim_command( "let g:UltiSnipsJumpBackwardTrigger='<M-S-Tab>'" )  -- Alt-Shift-Tab for prev placeholder
vim.api.nvim_command( "let g:UltiSnipsEditSplit='vertical'" )
vim.api.nvim_command( "let g:UltiSnipsSnippetsDir='../ultisnips'" )
vim.api.nvim_command( "let g:UltiSnipsSnippetDirectories=['../ultisnips', 'UltiSnips']" )

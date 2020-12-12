local M = {}

function M.configure_lsp()
  local nvim_lsp = require "lspconfig"

  -- Create on_attach callback
  local on_attach = function(_, bufnr)
--    require("diagnostic").on_attach()
    require("completion").on_attach()
  end

  local servers = {
    "pyls",
    "vimls",
    "bashls",
    "texlab",
  }

  for _, lsp_server in ipairs(servers) do
    nvim_lsp[lsp_server].setup {
      on_attach=on_attach
    }
  end

  -- TODO: Sumneko_lua needs a specific config. Refactor to be less WET.
  nvim_lsp["sumneko_lua"].setup {
    cmd = { "/home/anirudh/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/bin/Linux/lua-language-server", "-E", "/home/anirudh/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/main.lua" },
    on_attach=on_attach,
  }
end

return M

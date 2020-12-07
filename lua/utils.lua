function nvim_autocommand(def)
  --[[
    Applies an autocommand

    def (Table[str]): The content of the autocommand split into separate
      strings.
      
      Example:
        {"BufNewFile", "*.lua", "set ft=lua"}
  --]]
  local command = table.concat(vim.tbl_flatten("autocmd", def), " ")
  vim.api.nvim_command(command)
end


-- Modified from
-- https://github.com/norcalli/nvim_utils/blob/master/lua/nvim_utils.lua#L554-L567
function nvim_augroups(definitions)
  --[[
    Creates autocommand groups

    Arguments:
      definitions (Table(Table(Table(str)))): The outer table contains the
        augroup name. The second table contains the autocommands to
        execute. The innermost table contains the content of a single
        autocommand split up into separate strings.

        Example:
          (Lua)
          filetypes = {
            Lua = {
              {"BufNewFile", "*.lua", "set ft=lua"}
            }
          }
          nvim_create_augroups(filetypes)

          Is equivalent to:
          (Vimscript)
          augroup Lua
            autocmd!
            autocmd BufNewFile *.lua set ft=lua
          augroup END
  --]]
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command("augroup "..group_name)
    vim.api.nvim_command("autocmd!")
    for _, def in ipairs(definition) do
      -- Unwrap table into string split by " "
      nvim_autocommand(def)
    end
    vim.api.nvim_command("augroup END")
  end
end

-- Modified from
-- https://github.com/norcalli/nvim_utils/blob/master/lua/nvim_utils.lua
local valid_modes = {
  n = "n";
  v = "v";
  x = "x";
  i = "i";
  o = "o";
  t = "t";
  c = "c";
  s = "s";
  ["!"] = "!";
  [" "] = "";
}


function nvim_mappings(mappings, default_options)
  -- Create mappings
end


-- Table helpers
function table_concat(tab1, tab2)
  --[[
    Concatenates tab2 to the end of tab1

    Arguments:
      tab1 (Table): The table to which to concatenate
      tab2 (Table): The table that is concatenated to the end of the other.

    Returns
      tab1 (Table): The concatenated table
  --]]

  assert(type(tab1) == "table", "Table concat takes as arguments tables, but"
      .. " the tab1 provided is not a table.")
  assert(type(tab2) == "table", "Table concat takes as arguments tables, but"
      .. " the tab2 provided is not a table.")
  for _, v in ipairs(tab2) do
    table.insert(tab1, v)
  end
  return tab1
end

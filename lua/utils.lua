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


-- Modified from
-- https://github.com/norcalli/nvim_utils/blob/master/lua/nvim_utils.lua
function nvim_mappings(mappings, default_options)
  --[[
    Applies the mappings

    Arguments:
      mappings (Table): A table containing a list of mappings.
      default_options (Table): The default options for mappings
  --]]
  local current_bufnr = vim.api.nvim_get_current_buf()

  for key, options in pairs(mappings) do
    options = vim.tbl_extend("keep", options, default_options or {})

    -- Protect against bufnr == 0 as it denotes current buffer
    local bufnr = current_bufnr
    if type(options.buffer) == "number" and options.buffer ~= 0 then
      bufnr = options.bufnr
    end

    -- Get the first letter of the key and ensure that it's an allows nvim mode
    local mode, mapping = key:match("^(.)(.+)$")
    if not mode then
      assert(false, "nvim_mappings: invalid mode for keymapping "..key)
    end
    if not valid_modes[mode] then
      assert(false, "nvim_mappings: invalid mode for keymapping. mode="..mode)
    end
    mode = valid_modes[mode]

    -- Set the keymap
    local rhs = options[1]
    options[1] = nil
    if options.buffer then
      options.buffer = nil
      vim.api.nvim_buf_set_keymap(bufnr, mode, mapping, rhs, options)
    else
      vim.api.nvim_set_keymap(mode, mapping, rhs, options)
    end
  end
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

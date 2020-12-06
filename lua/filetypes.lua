require "utils"

function load_command(tab)
  --[[
    Creates an autocommand for new files that is formatted for
    nvim_create_augroups

    Arguments:
      tab (Table): A table containing the file extension as its first element
        and the filetype setter as its second element.

    Returns
      loader (Table): A table containing BufNewFile,BufReadPre,FileReadPre as
        its first element, the file extension as its second element, and the
        filetype setter as its third element.
  --]]
  local loader = {"BufNewFile,BufReadPre,FileReadPre"}
  local loader = table_concat(loader, tab)

  return loader
end

-- Create new filetypes
local filetypes ={
  textFile = {
      load_command({"*.txt", "set ft=text"})
  };
  luaFile = {
      load_command({"*.lua", "set ft=lua"})
  };
  latex = {
      load_command({"*.tex,*.bib,", "set ft=latex"})
  };
  markdown = {
      load_command({"*.md", "set ft=markdown"})
  };
}

-- Filetype autocommand groups
nvim_create_augroups(filetypes)

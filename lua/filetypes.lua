require "utils"

function load_command(tab)
    local loader = {"BufNewFile,BufReadPre,FileReadPre"}
    local loader = table_concat(loader, tab)

    return loader
end

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

nvim_create_augroups(filetypes)

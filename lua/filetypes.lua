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
    --latex = {
        --{"BufNewFile,BufReadPre,FileReadPre", "*.tex,*.bib", "set ft=latex"}
    --};
}

nvim_create_augroups(filetypes)

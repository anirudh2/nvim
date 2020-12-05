require "utils"

-- TODO: Check working

local new_file = "BufNewFile,BufReadPre,FileReadPre"

local filetypes ={
    textFile = {
        {"BufNewFile,BufReadPre,FileReadPre", "*.txt", "set ft=text"}
    };
    luaFile = {
        {"BufNewFile,BufReadPre,FileReadPre", "*.lua", "set ft=lua"}
    };
    --latex = {
        --{"BufNewFile,BufReadPre,FileReadPre", "*.tex,*.bib", "set ft=latex"}
    --};
}

nvim_create_augroups(filetypes)

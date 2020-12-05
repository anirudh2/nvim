require "utils"

-- TODO: Check working

local new_file = "BufNewFile,BufReadPre,FileReadPre"

local filetypes ={
    python = {
        {"BufNewFile,BufReadPre,FileReadPre", "*.py", "set ft=python"}
    };
    --latex = {
        --{"BufNewFile,BufReadPre,FileReadPre", "*.tex,*.bib", "set ft=latex"}
    --};
}

nvim_create_augroups(filetypes)

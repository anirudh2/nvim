-- Taken from
-- https://github.com/norcalli/nvim_utils/blob/master/lua/nvim_utils.lua#L554-L567
function nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.api.nvim_command("augroup "..group_name)
        vim.api.nvim_command("autocmd!")
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten("autocmd", def), " ")
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command("augroup END")
    end
end

-- Table helpers
function table_concat(tab1, tab2)
    -- Concatenates tab2 to the end of tab2

    assert(type(tab1) == "table", "Table concat takes as arguments tables, but"
            .. " the tab1 provided is not a table.")
    assert(type(tab2) == "table", "Table concat takes as arguments tables, but"
            .. " the tab2 provided is not a table.")
    for i,v in ipairs(tab2) do
	table.insert(tab1, v)
    end
    return tab1
end

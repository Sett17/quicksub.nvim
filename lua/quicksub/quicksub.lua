local M = {}

M.quicksub = function()
    vim.cmd('normal! u')
    local old_reg = vim.fn.getreg('"')
    local old_clipboard = vim.o.clipboard
    vim.o.clipboard = ''
    vim.cmd('normal! gv"xy')
    local selected_text = vim.fn.getreg('"')
    vim.fn.setreg('"', old_reg)
    vim.o.clipboard = old_clipboard
    vim.cmd('normal! u')
    vim.cmd('normal! <C-c>')
    selected_text = selected_text:gsub("([%.%*%\\%/[%]%^%$])", "\\%1")
    selected_text = selected_text:gsub("\n", "\\n")
    local range = vim.fn.input("Enter the range offset: ")
    local command_start = ':'
    if range == '%' then
        command_start = command_start .. '%'
    else
        if tonumber(range) ~= nil then
            command_start = command_start .. ',+' .. range
        else
            command_start = command_start .. ',' .. range
        end
    end
    local command = command_start .. "s/\\(" .. selected_text .. "\\)//gi"
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(command .. "<Left><Left><Left>", true, true, true), 'n', false)
end

return M

print("loaded rgpt")
function Read_file()
    local current_path = vim.api.nvim_buf_get_name(0)
    local command = string.format("rgpt --input \"$(git diff %s)\"", current_path)
    local output = vim.fn.system(command)
    if string.match(output, "Input flag is empty") then
        print("The current file has no git diff")
        return
    end
    local filename = Write_File(output)
    vim.cmd('vsplit')
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_win_set_buf(win, buf)
    vim.cmd("edit " .. filename)
    os.remove(filename)
end
function Write_File(output)
    local file = io.open("/tmp/rgpt-output", "w+")
    if file ~= nil then
        io.output(file)
        io.write(output)
        io.close(file)
        return "/tmp/rgpt-output"
    else
        print("Error writing file")
        os.exit(1)
    end
end

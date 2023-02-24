print("loaded rgpt")
function Read_file()
    local current_path = vim.api.nvim_buf_get_name(0)
    local command = string.format("rgpt --input \"$(git diff %s)\"", current_path)
    local output = vim.fn.system(command)
    if string.match(output, "Input flag is empty") then
        print("The current file has no git diff")
        return
    end
    print(output)
end

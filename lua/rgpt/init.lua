print("loaded rgpt")
function Read_file()
    local current_path = vim.api.nvim_buf_get_name(0)
    local handle = io.popen(string.format("rgpt --input \"$(git diff %s)\"", current_path))
    if handle == nil then
       print("The output is not right")
       os.exit(1)
    end
    local result = handle:read("*a")
    handle:close()
    print(result)
end



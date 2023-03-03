local json = require("rgpt.json")
local M = {}
function M.start_reviewing(config)
    local model = config.model or "text-davinci-003"
    local max_tokens = config.max_tokens or 500
    local temp = config.temperature or 0.2
    local top_p = config.top_p or 1
    local frequence_pen = config.frequence_penalty or 1.2
    local presence_pen = config.presence_penalty or 0.3
    local best_of = config.best_of or 1
    local current_path = vim.api.nvim_buf_get_name(0)
    local command = string.format("rgpt --input \"$(git diff %s)\" --model \"%s\" --max %s --temp %s --topp %s --freq %s --pres %s --best %s --pretty=false", current_path, model, max_tokens, temp, top_p, frequence_pen, presence_pen, best_of)
    local output = vim.fn.system(command)
    if string.match(output, "Input flag is empty") then
        print("The current file has no git diff")
        return
    elseif string.match(output, "error") then
        local jsonData = json.decode(output)
        output = string.format("Message: %s, Error: %s", jsonData.message, jsonData.error)
    end
    local filename = M.write_file(output)
    vim.cmd('vsplit')
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_win_set_buf(win, buf)
    vim.cmd("edit " .. filename)
    os.remove(filename)
end
function M.write_file(output)
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
return M

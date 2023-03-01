local M = {}
M._config = {}
function M.setup(config)
    M._config = config
end

-- example:
--[[
M.setup({
    model = "text-davinci-003",
    max_tokens = 300,
    temperature = 0,
    top_p = 1,
    frequence_penlty = 1.3,
    presence_penalty = 0.1,
    best_of = 1,
})
--]]
return M

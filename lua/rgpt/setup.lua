local M = {}
M._config = {}
function M.setup(config)
    M._config = config
end

-- example:
--[[
M.setup({
    model = "turbo",
    max_tokens = 200,
    temperature = 0.2,
    top_p = 1,
    frequence_penalty = 1.2,
    presence_penalty = 0.3,
    best_of = 1,
})
--]]
return M

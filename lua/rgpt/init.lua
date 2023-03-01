local start_rgpt = require("rgpt.start_rgpt")
local config = require("rgpt.setup")
local M = {}
function M.main(args)
    arg = args["args"]
    if arg == "review" then
        start_rgpt.start_reviewing(config._config)
    elseif arg == "" then
        print("No arguments")
    else
        print(arg, "is not a valid argument")
    end
end
M.setup = config.setup
local completions = {
    "review"
}
M.opts = {
    nargs = 1,
    complete = function()
        return completions
    end
}
return M

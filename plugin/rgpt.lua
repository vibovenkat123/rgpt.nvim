local rgpt = require("rgpt")
vim.api.nvim_create_user_command("ReviewGPT", rgpt.main, rgpt.opts)

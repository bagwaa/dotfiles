require("dap-python").setup("~/Code/Python/.virtualenvs/debugpy/bin/python")
require("dapui").setup()

vim.keymap.set("n", "<leader>dt", ":DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<leader>dc", ":DapContinue<CR>")
vim.keymap.set("n", "<leader>dd", ":lua require('dapui').toggle()<CR>")

local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

-- dap.listeners.before.event_terminated["dapui_config"] = function()
-- 	dapui.close()
-- end

-- dap.listeners.before.event_exited["dapui_config"] = function()
-- 	dapui.close()
-- end

require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
require("dapui").setup()

vim.keymap.set("n", "<F1>", ":DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<F2>", ":DapStepOver<CR>")
vim.keymap.set("n", "<F3>", ":DapStepInto<CR>")
vim.keymap.set("n", "<F4>", ":DapStepOut<CR>")
vim.keymap.set("n", "<F5>", ":DapContinue<CR>")

vim.keymap.set("n", "<F10>", ":lua require('dapui').toggle()<CR>")

local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = "/Users/richard/.local/share/nvim/mason/bin/codelldb",
        args = { "--port", "${port}" },
    },
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        showDisassembly = "never",
    },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

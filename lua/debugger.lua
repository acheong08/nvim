vim.pack.add({
	-- Debugger
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/rcarriga/nvim-dap-ui", -- UI
	"https://github.com/nvim-neotest/nvim-nio",
})

local dap = require("dap")
local dapui = require("dapui")

-- Setup nvim-dap-ui
dapui.setup()

-- Automatically open/close UI when debugging starts/stops
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

-- UI Commands
vim.api.nvim_create_user_command("DapOpen", function()
	dapui.open()
end, { desc = "Open DAP UI" })

vim.api.nvim_create_user_command("DapClose", function()
	dapui.close()
end, { desc = "Close DAP UI" })

vim.api.nvim_create_user_command("DapToggle", function()
	dapui.toggle()
end, { desc = "Toggle DAP UI" })

-- Debugging Control Commands
vim.api.nvim_create_user_command("DapContinue", function()
	dap.continue()
end, { desc = "Start/Continue debugging" })

vim.api.nvim_create_user_command("DapStepOver", function()
	dap.step_over()
end, { desc = "Step over" })

vim.api.nvim_create_user_command("DapStepInto", function()
	dap.step_into()
end, { desc = "Step into" })

vim.api.nvim_create_user_command("DapStepOut", function()
	dap.step_out()
end, { desc = "Step out" })

vim.api.nvim_create_user_command("DapTerminate", function()
	dap.terminate()
end, { desc = "Terminate debugging session" })

-- Breakpoint Commands
vim.api.nvim_create_user_command("DapBreakpoint", function()
	dap.toggle_breakpoint()
end, { desc = "Toggle breakpoint" })

vim.api.nvim_create_user_command("DapBreakpointCondition", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Set conditional breakpoint" })

vim.api.nvim_create_user_command("DapBreakpointLog", function()
	dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "Set log point" })

vim.api.nvim_create_user_command("DapClearBreakpoints", function()
	dap.clear_breakpoints()
end, { desc = "Clear all breakpoints" })

-- REPL Commands
vim.api.nvim_create_user_command("DapRepl", function()
	dap.repl.toggle()
end, { desc = "Toggle REPL" })

vim.api.nvim_create_user_command("DapReplOpen", function()
	dap.repl.open()
end, { desc = "Open REPL" })

-- Evaluation Commands
vim.api.nvim_create_user_command("DapEval", function()
	dapui.eval()
end, { desc = "Evaluate expression under cursor" })

vim.api.nvim_create_user_command("DapEvalExpression", function()
	local expr = vim.fn.input("Expression: ")
	if expr ~= "" then
		dapui.eval(expr)
	end
end, { desc = "Evaluate custom expression" })

-- Floating Element Commands
vim.api.nvim_create_user_command("DapScopes", function()
	dapui.float_element("scopes", { enter = true })
end, { desc = "Show scopes in floating window" })

vim.api.nvim_create_user_command("DapStacks", function()
	dapui.float_element("stacks", { enter = true })
end, { desc = "Show stacks in floating window" })

vim.api.nvim_create_user_command("DapWatches", function()
	dapui.float_element("watches", { enter = true })
end, { desc = "Show watches in floating window" })

vim.api.nvim_create_user_command("DapBreakpoints", function()
	dapui.float_element("breakpoints", { enter = true })
end, { desc = "Show breakpoints in floating window" })

vim.api.nvim_create_user_command("DapConsole", function()
	dapui.float_element("console", { enter = true })
end, { desc = "Show console in floating window" })

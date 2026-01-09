vim.pack.add({
	-- Debugger
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/rcarriga/nvim-dap-ui", -- UI
	"https://github.com/nvim-neotest/nvim-nio",
})

require("dapui").setup()

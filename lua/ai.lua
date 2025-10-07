vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/CopilotC-Nvim/CopilotChat.nvim",
})

require("CopilotChat").setup({
	model = "claude-haiku-4.5",
})

vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/CopilotC-Nvim/CopilotChat.nvim",
})

require("CopilotChat").setup({
	model = "gpt-5-mini",
})

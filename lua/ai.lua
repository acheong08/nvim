vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/CopilotC-Nvim/CopilotChat.nvim",
})

require("CopilotChat").setup({
	model = "gemini-3-flash-preview",
})
vim.pack.add({
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
})

-- Configure Copilot and Copilot-LSP

require("copilot").setup({
	suggestion = {
		enabled = true,
		auto_trigger = true,
		debounce = 75,
		keymap = {
			accept = "<M-l>",
			accept_word = false,
			accept_line = false,
			next = "<M-]>",
			prev = "<M-[>",
			dismiss = "<C-]>",
		},
	},
	panel = { enabled = true },
})

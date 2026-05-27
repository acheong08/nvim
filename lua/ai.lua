vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/zbirenbaum/copilot.lua",
	"https://github.com/CopilotC-Nvim/CopilotChat.nvim",
})

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
	-- Enable copilot on ALL filetypes (including markdown, yaml, etc.)
	filetypes = {
		["*"] = true,
		["markdown"] = false,
	},
	server_opts_overrides = {
		settings = {
			telemetry = {
				telemetryLevel = "off",
			},
		},
	},
})

require("CopilotChat").setup()

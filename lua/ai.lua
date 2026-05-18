vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
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
	},
	server_opts_overrides = {
		settings = {
			telemetry = {
				telemetryLevel = "off",
			},
		},
	},
})

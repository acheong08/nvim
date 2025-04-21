-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
	{
		{
			"zbirenbaum/copilot.lua",
			opts = {
				server_opts_overrides = {
					settings = {
						telemetry = {
							telemetryLevel = "off",
						},
					},
				},
			},
		},
	},
	{
		{
			"CopilotC-Nvim/CopilotChat.nvim",
			branch = "main",
			dependencies = {
				{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
				{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
			},
			build = "make tiktoken", -- Only on MacOS or Linux
			opts = {
				debug = false, -- Enable debugging
				model = "o3-mini",
				chat_autocomplete = true,
				window = {
					-- layout = 'replace',
				},
				context = "register",
				include_contexts_in_prompt = false,
				-- See Configuration section for rest
			},
			-- See Commands section for default commands if you want to lazy load on them
		},
	},
	{
		"https://git.sr.ht/~swaits/scratch.nvim",
		lazy = true,
		keys = {
			{ "<leader>bs", "<cmd>Scratch<cr>", desc = "Scratch Buffer", mode = "n" },
			{ "<leader>bS", "<cmd>ScratchSplit<cr>", desc = "Scratch Buffer (split)", mode = "n" },
		},
		cmd = {
			"Scratch",
			"ScratchSplit",
		},
		opts = {},
	},
	{
		"hiphish/rainbow-delimiters.nvim",
	},
}

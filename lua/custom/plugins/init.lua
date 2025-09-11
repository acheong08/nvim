-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "copilot-*",
	callback = function()
		-- Set buffer-local options
		vim.opt_local.relativenumber = true
		vim.opt_local.number = true
		vim.opt_local.conceallevel = 0
	end,
})
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
	-- {
	-- 	"copilotlsp-nvim/copilot-lsp",
	-- 	init = function()
	-- 		vim.g.copilot_nes_debounce = 500
	-- 		vim.lsp.enable("copilot_ls")
	-- 		vim.keymap.set("n", "<tab>", function()
	-- 			-- Try to jump to the start of the suggestion edit.
	-- 			-- If already at the start, then apply the pending suggestion and jump to the end of the edit.
	-- 			local _ = require("copilot-lsp.nes").walk_cursor_start_edit()
	-- 				or (
	-- 					require("copilot-lsp.nes").apply_pending_nes()
	-- 					and require("copilot-lsp.nes").walk_cursor_end_edit()
	-- 				)
	-- 		end)
	-- 	end,
	-- },
	{
		{
			"CopilotC-Nvim/CopilotChat.nvim",
			branch = "main",
			dependencies = {
				{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
			},
			build = "make tiktoken", -- Only on MacOS or Linux
			opts = {
				debug = false, -- Enable debugging
				model = "gpt-4.1",
				chat_autocomplete = true,
				window = {
					-- layout = "replace",
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

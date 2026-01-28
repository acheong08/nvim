vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/CopilotC-Nvim/CopilotChat.nvim",
})

require("CopilotChat").setup({
	model = "gemini-3-flash-preview",
})
vim.pack.add({
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
	{ src = "https://github.com/copilotlsp-nvim/copilot-lsp" },
	-- Blink is already added in ./base.lua
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
	panel = { enabled = false },
})

vim.lsp.enable("copilot_ls")

vim.keymap.set("n", "<Tab>", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local state = vim.b[bufnr].nes_state

	if state then
		local nes = require("copilot-lsp.nes")
		local jumped = nes.walk_cursor_start_edit()
		if not jumped then
			nes.apply_pending_nes()
			nes.walk_cursor_end_edit()
		end
		return nil
	else
		return "<C-i>"
	end
end, { expr = true, desc = "Accept/jump to NES suggestion" })

vim.keymap.set("n", "<Esc>", function()
	local cleared = require("copilot-lsp.nes").clear()
	if not cleared then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
	end
end, { desc = "Clear NES or normal Escape" })

require("copilot-lsp").setup({
	nes = {
		move_count_threshold = 3,
	},
})

require("blink.cmp").setup({
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	keymap = { preset = "default" },
	fuzzy = {
		prebuilt_binaries = { download = true, force_version = "v1.7.0" },
	},
})

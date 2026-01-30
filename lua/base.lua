vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.opt.clipboard = "unnamedplus"

-- Baseline requirements such as tree-sitter
vim.pack.add({
	-- Shared deps
	"https://github.com/nvim-tree/nvim-web-devicons", -- Telescope and buffer tab
	-- Tree sitter
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
	"https://github.com/MeanderingProgrammer/treesitter-modules.nvim",
	-- LSP
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	{ src = "https://github.com/stevearc/conform.nvim", name = "conform" },
	-- Buffer tab titles
	"https://github.com/romgrk/barbar.nvim",
	-- Telescope
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
	-- Completion
	"https://github.com/Saghen/blink.cmp",
	"https://github.com/rafikdraoui/jj-diffconflicts",
})
vim.pack.add({
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = vim.version.range("3"),
	},
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
})

require("nvim-treesitter").install({ "lua", "typescript", "go" })

require("treesitter-modules").setup({
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = { enable = false },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<c-a>",
			node_incremental = "<c-a>",
			scope_incremental = "<c-s>",
			node_decremental = "<c-d>",
		},
	},
})

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
		"gopls",
		"prettier",
		"typstyle",
		"biome",
		"typescript-language-server",
		"svelte-language-server",
		"shfmt",
		"jdtls",
		"ruff",
		"basedpyright",
		"google-java-format",
		"ktfmt",
	},
})
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		markdown = { "prettier" },
		typst = { "typstyle" },
		svelte = { "prettier" },
		shell = { "shfmt" },
		sh = { "shfmt" },
		-- Conform will run multiple formatters sequentially
		-- python = { "isort", "black" },
		-- -- You can customize some of the format options for the filetype (:help conform.format)
		-- rust = { "rustfmt", lsp_format = "fallback" },
		-- -- Conform will run the first available formatter
		javascript = { "biome" },
		typescript = { "biome" },
		typescriptreact = { "biome" },
		python = { "ruff" },
		java = { "google-java-format" },
		kotlin = { "ktfmt" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 2000,
		lsp_format = "fallback",
	},
})
require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
	},
})

vim.lsp.config["ts_ls"] = {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "typescript", "svelte", "typescriptreact" },
	root_markers = { ".git" },
}

vim.lsp.enable("typescript-language-server")

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "<C-S-tab>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<C-tab>", "<Cmd>BufferNext<CR>", opts)
map("n", "<C-S-w>", "<Cmd>BufferClose<CR>", opts)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

-- Enable Telescope extensions if they are installed
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

-- See `:help telescope.builtin`
local telescope_builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
-- vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", telescope_builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "gr", telescope_builtin.lsp_references, { desc = "[G]oto [R]eferences" })
-- vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
-- vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", telescope_builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", telescope_builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", telescope_builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", telescope_builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", telescope_builtin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>zf", telescope_builtin.spell_suggest, { desc = "Telescope: Find spell word suggestion" })

-- LSP shortcuts
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

-- Scratch buffer
vim.keymap.set("n", "<leader>bs", function()
	vim.cmd("enew")
	vim.bo.buftype = "nofile"
	vim.bo.bufhidden = "wipe"
	vim.bo.swapfile = false
end, { desc = "[B]uffer [S]cratch - create new scratch buffer" })

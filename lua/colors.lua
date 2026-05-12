vim.pack.add({ { src = "https://github.com/navarasu/onedark.nvim" } })

-- Colors
require("onedark").setup({
	style = "dark",
	highlights = {
		["@comment"] = { fg = "$black", bg = "$bg_yellow" },
	},
})
-- Enable theme
require("onedark").load()
vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
vim.cmd("highlight EndOfBuffer ctermbg=NONE guibg=NONE")

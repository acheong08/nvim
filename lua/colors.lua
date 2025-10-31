vim.pack.add({ { src = "https://github.com/navarasu/onedark.nvim" } })

-- Colors
require("onedark").setup({
	style = "deep",
})
-- Enable theme
require("onedark").load()
vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
vim.cmd("highlight EndOfBuffer ctermbg=NONE guibg=NONE")

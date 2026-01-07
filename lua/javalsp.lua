vim.pack.add({
	"https://github.com/nvim-java/nvim-java-dap",
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-java/lua-async-await",
	{ src = "https://github.com/nvim-java/nvim-java", version = "v4.0.0" },
	"https://github.com/JavaHello/spring-boot.nvim",
})
require("java").setup({
	jdk = {
		auto_install = false,
		version = "23.0.2",
	},
})
vim.lsp.config("jdtls", {})

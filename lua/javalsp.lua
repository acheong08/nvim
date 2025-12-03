vim.pack.add({
	"https://github.com/nvim-java/nvim-java-dap",
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-java/lua-async-await",
	{ src = "https://github.com/nvim-java/nvim-java", version = "v4.0.0" },
	"https://github.com/JavaHello/spring-boot.nvim",
})
require("java").setup()
vim.lsp.config("jdtls", {
	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-25",
						path = "/home/acheong/.sdkman/candidates/java/current",
						default = true,
					},
				},
			},
		},
	},
})

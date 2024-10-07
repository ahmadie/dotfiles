require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({})

require("mason").setup({
	ensure_installed = {
		"stylua",
		"black",
		"isort",
		"rust_analyzer",
		"bashls",
		"lua_ls",
		"vimls",
		"pyright",
	},
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
	settings = { Lua = {
		diagnostics = {
			globals = { "vim" },
		},
	} },
})

lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {},
	},
})

lspconfig.pyright.setup({
	capabilities = capabilities,
	settings = {},
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings.
		local opts = { buffer = ev.buf }

		-- Map to show references using fzf-lua
		vim.keymap.set("n", "gr", function()
			require("fzf-lua").lsp_references({
				jump_to_single_result = true,
				fzf_opts = {
					["--layout"] = "reverse-list",
				},
			})
		end, opts)

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	end,
})

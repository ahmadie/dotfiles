return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local lspconfig = require("lspconfig")

		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
			settings = {
				["rust-analyzer"] = {},
			},
		})

		lspconfig.pyright.setup({
			capabilities = capabilities,
			settings = {
				python = {
					analysis = {
						typeStubSearchPaths = {
							"./trading_engine/nautilus_trader/nautilus_trader/core",
						},
					},
				},
			},
		})

		lspconfig.ts_ls.setup({
			capabilities = capabilities,
			init_options = {
				preferences = {
					disableSuggestions = false,
					importModuleSpecifierPreference = "relative",
				},
			},
			-- Add root_dir pattern to properly identify project root
			root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
			-- Enable inlay hints for TypeScript (available in newer versions of tsserver)
			settings = {
				typescript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
					},
				},
				javascript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
					},
				},
			},
		})

		lspconfig.eslint.setup({
			capabilities = capabilities,
			settings = {
				packageManager = "npm",
			},
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		})

		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
			filetypes = {
				"html",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
			},
			init_options = {
				userLanguages = {
					typescript = "javascript",
					typescriptreact = "javascriptreact",
				},
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf }

				vim.keymap.set("n", "gw", function()
					require("fzf-lua").lsp_references({
						jump_to_single_result = true,
						fzf_opts = {
							["--layout"] = "reverse-list",
						},
					})
				end, opts)

				vim.keymap.set("n", "gt", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", {})
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "gl", function()
					vim.diagnostic.open_float(nil, { focusable = false, scope = "line" })
				end, opts)
			end,
		})
	end,
}

return {
	{
		"gbprod/yanky.nvim",
		dependencies = { "kkharji/sqlite.lua" },
		opts = {
			ring = {
				history_length = 100,
				storage = "sqlite",
				sync_with_numbered_registers = true,
				cancel_event = "update",
			},
			picker = {
				select = {
					action = nil,
				},
			},
			system_clipboard = {
				sync_with_ring = true,
				clipboard_register = "+",
			},
			highlight = {
				on_put = true,
				on_yank = true,
				timer = 200,
			},
		},
		keys = {
			-- Navigation in history
			{ "<c-n>", "<Plug>(YankyPreviousEntry)", mode = "n" },
			{ "<c-p>", "<Plug>(YankyNextEntry)", mode = "n" },
			{ "[y", "<Plug>(YankyPreviousEntry)", mode = "n" },
			{ "]y", "<Plug>(YankyNextEntry)", mode = "n" },
			-- Putting mappings
			{ "p", "<Plug>(YankyPutAfter)", mode = "n" },
			{ "P", "<Plug>(YankyPutBefore)", mode = "n" },
		},
	},
	{
		"gbprod/cutlass.nvim",
		event = "VeryLazy", -- Ensure it loads early
		config = function()
			require("cutlass").setup({
				cut_key = "m", -- Your cut key
			})
		end,
	},
	{
		"gbprod/substitute.nvim",
		opts = {
			on_substitute = nil,
			yank_substituted_text = false,
			highlight_substituted_text = {
				enabled = true,
				timer = 200,
			},
			range = {
				prefix = "s",
				prompt_current_text = false,
				confirm = false,
				complete_word = false,
				motion1 = false,
				motion2 = false,
				suffix = "",
			},
			exchange = {
				motion = false,
				use_esc_to_cancel = true,
			},
		},
		keys = {
			-- Substitute
			{ "gr", "<cmd>lua require('substitute').operator()<cr>", mode = "n" },
			{ "grr", "<cmd>lua require('substitute').line()<cr>", mode = "n" },
			{ "gR", "<cmd>lua require('substitute').eol()<cr>", mode = "n" },
			{ "gr", "<cmd>lua require('substitute').visual()<cr>", mode = "x" },
			-- Range substitution
			{ "<leader>s", "<cmd>lua require('substitute.range').operator()<cr>", mode = "n" },
			{ "<leader>s", "<cmd>lua require('substitute.range').visual()<cr>", mode = "x" },
			{ "<leader>ss", "<cmd>lua require('substitute.range').word()<cr>", mode = "n" },
		},
	},
}

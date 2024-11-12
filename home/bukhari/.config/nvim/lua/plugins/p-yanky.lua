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
				clipboard_register = nil,
			},
			highlight = {
				on_put = true,
				on_yank = true,
				timer = 200,
			},
		},
		keys = {
			-- Your original Y mapping
			{ "Y", "y$", mode = "n" },
			-- Your original visual y mapping
			{ "y", '"+y', mode = "v" },
			-- Delete mappings (won't yank)
			{ "d", '"_d', mode = { "n", "v" } },
			{ "D", '"_D', mode = "n" },
			{ "dd", '"_dd', mode = "n" },
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
		opts = {
			cut_key = "m",
			override_del = true,
			exclude = { "ns", "nS" },
		},
		keys = {
			{ "m", mode = { "n", "x" } },
			{ "mm", mode = "n" },
			{ "M", mode = "n" },
		},
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

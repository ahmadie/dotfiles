return {
	"stevearc/oil.nvim",
	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
	},
	opts = {
		columns = {
			"icon",
			"permissions",
			"size",
			"mtime",
		},
		use_default_keymaps = true,
		delete_to_trash = true,
		keymaps = {
			["?"] = "actions.show_help",
			["q"] = "actions.close",
			["<C-t>"] = {
				callback = function()
					require("oil.actions").select_tab.callback()
					require("oil.actions").close.callback()
				end,
				desc = "Open in new tab and close Oil",
			},
		},
		view_options = {
			show_hidden = true,
			sort = {
				{ "ctime", "asc" },
			},
		},
	},
}

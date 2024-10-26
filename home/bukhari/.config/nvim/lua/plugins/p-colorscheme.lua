return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		transparent_background = false,
		flavour = "mocha",
		integrations = {},
		highlight_overrides = {
			mocha = {
				DiffText = { bg = "#d54e53", bold = true },
				DiffChange = { bg = "#303030" },
				DiffAdd = { bg = "#303030" },
				DiffDelete = { fg = "#9D4D50", bg = "#303030" },
				CocHighlightText = { fg = "#d54e53", bg = "#303030" },
				SignColumn = { bg = "NONE" },
				PounceAccept = { fg = "black", bg = "white" },
				PounceGap = { bg = "#404040" },
				PounceMatch = { fg = "#d54e53", bg = "#404040" },
				PounceAcceptBest = { fg = "black", bg = "yellow" },
				CocInlayHint = { fg = "black" },
			},
		},
	},
	init = function()
		vim.cmd.colorscheme("catppuccin")
	end,
}

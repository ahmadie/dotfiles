return {
	"akinsho/bufferline.nvim",
	version = "*",
	keys = {
		{ "<Tab>", "<CMD>BufferLineCycleNext<CR>", silent = true },
		{ "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>", silent = true },
		{ "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", silent = true },
		{ "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", silent = true },
		{ "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", silent = true },
		{ "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", silent = true },
		{ "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", silent = true },
		{ "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", silent = true },
		{ "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", silent = true },
		{ "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", silent = true },
		{ "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", silent = true },
	},
	opts = {
		options = {
			mode = "tabs",
			numbers = function(opts)
				return string.format("%s", opts.ordinal)
			end,
			separator_style = { "", "" },
			show_close_icon = false,
			show_buffer_close_icons = false,
			show_tab_indicators = false,
			color_icons = true,
			enforce_regular_tabs = false,
			max_name_length = 30,
			indicator = {
				icon = "",
				style = "none",
			},
		},
	},
}

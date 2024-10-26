return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>/", "<cmd>lua require('fzf-lua').blines()<CR>", silent = true },
		{ "<leader>i", "<cmd>lua require('fzf-lua').lines()<CR>", silent = true },
		{ "<leader>e", "<cmd>lua require('fzf-lua').files()<CR>", silent = true },
		{ "<leader>E", "<cmd>lua require('fzf-lua').git_files()<CR>", silent = true },
		{ "<leader>o", "<cmd>lua require('fzf-lua').oldfiles()<CR>", silent = true },
		{ "<leader>f", "<cmd>lua require('fzf-lua').grep()<CR>", silent = true },
		{ "<leader>F", "<cmd>lua require('fzf-lua').grep_project()<CR>", silent = true },
		{ "<leader>t", "<cmd>lua require('fzf-lua').tabs()<CR>", silent = true },
		{ "<leader>b", "<cmd>lua require('fzf-lua').buffers()<CR>", silent = true },
	},
	opts = {
		fullscreen = true,
		border = "single",
		grep = {
			prompt = " ",
			multiprocess = true,
			git_icons = true,
			file_icons = true,
			color_icons = true,
			rg_opts = "--type-add='project:*.{js,jsx,vue,ts,tsx,vim,rs,dart,py}' -g='!renderer.dev.js' --column --line-number --no-heading --color=always --smart-case",
		},
		files = {
			prompt = " ",
		},
		oldfiles = {
			prompt = " ",
		},
		lines = {
			prompt = " ",
		},
		blines = {
			prompt = " ",
			fzf_opts = {
				["--delimiter"] = "[\\]:]",
				["--with-nth"] = "3..",
			},
			winopts = {
				fullscreen = true,
				height = 0.99,
				width = 1,
				preview = {
					border = "none",
					layout = "vertical",
					vertical = "up:80%",
					title = false,
					winopts = {
						scrollbar = false,
						signcolumn = "yes:2",
					},
				},
			},
		},
		buffers = {
			prompt = " ",
		},
		tabs = {
			prompt = " ",
		},
		git = {
			files = {
				prompt = " ",
			},
		},
		winopts = {
			height = 1,
			width = 1,
			row = 0.35,
			col = 0.5,
			border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
			hl = {
				cursor = "Error",
				search = "Search",
			},
		},
		fzf_opts = {
			["--marker"] = "+",
			["--color"] = "fg:#cdd6f4,bg:-1,hl:#f38ba8:bold ",
			["--color"] = "fg+:#f5e0dc",
			["--color"] = "info:#f38ba8,prompt:-1,pointer:#af5fff ",
			["--color"] = "marker:#f38ba8,spinner:#f5e0dc,header:#525252 ",
			["--color"] = "border:#57c7ff",
			["--color"] = "pointer:reverse,prompt:#cba6f7,input:159 ",
			["--color"] = "fg+:bold,hl+:#f38ba8:bold",
			["--prompt"] = " ",
			["--info"] = "default",
			["--height"] = "100%",
			["--preview-window"] = "sharp",
			["--pointer"] = "⠀",
		},
	},
}

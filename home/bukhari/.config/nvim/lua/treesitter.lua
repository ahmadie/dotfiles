local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = "all",
	sync_install = false,

	highlight = {
		enable = true, -- false will disable the whole extension
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true, disable = { "" } },

	matchup = {
		enable = true,
	},
})

vim.cmd([[
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
]])

require("nvim-treesitter.configs").setup({
	textobjects = {
		select = {
			enable = true,
			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]f"] = "@function.outer",
				["]g"] = "@loop.outer",
			},
			goto_next_end = {
				["]F"] = "@function.outer",
				["]G"] = "@loop.outer",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
				["[g"] = "@loop.outer",
			},
			goto_previous_end = {
				["[F"] = "@function.outer",
				["[G"] = "@loop.outer",
			},
		},
	},
})

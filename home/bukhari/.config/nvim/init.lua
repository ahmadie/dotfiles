require("options")
require("keymaps")

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true

vim.g.python3_host_prog = "~/.pyenv/shims/python3"

-- disable plugin mappings
vim.g.vimwiki_key_mappings = { all_maps = 0 }
vim.cmd([[
  let g:vimwiki_list = [{'path': '~/Beauty/vimwiki/', 'path_html' : '~/Beauty/vimwiki_html'}]
  let g:jukit_mappings = 0
]])
-- end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Dependencies
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",

	-- LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	{ "stevearc/conform.nvim", opts = {} },

	-- comp
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"onsails/lspkind.nvim",

	-- UI and Aesthetics
	"Shatur/neovim-ayu",
	{ "catppuccin/nvim", as = "catppuccin" },
	"norcalli/nvim-colorizer.lua",
	{ "akinsho/bufferline.nvim", version = "*" },
	"rcarriga/nvim-notify",
	{
		"stevearc/dressing.nvim",
		opts = {},
	},

	-- Treesitter and related
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-context",
	{ "nvim-treesitter/nvim-treesitter-textobjects", dependencies = "nvim-treesitter/nvim-treesitter" },
	{ "Wansmer/treesj", dependencies = "nvim-treesitter/nvim-treesitter" },

	-- Text objects and motions
	"wellle/targets.vim",
	{
		"kana/vim-textobj-user",
		dependencies = {
			"kana/vim-textobj-line",
			"ColinKennedy/vim-indent-object",
			"Julian/vim-textobj-variable-segment",
			"tkhren/vim-textobj-numeral",
		},
	},
	"machakann/vim-sandwich",
	"andymass/vim-matchup",

	-- Editing and navigation
	"svermeulen/vim-yoink",
	"svermeulen/vim-cutlass",
	"svermeulen/vim-subversive",
	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"machakann/vim-highlightedyank",
	"rhysd/clever-f.vim",
	"rlane/pounce.nvim",
	"brenoprata10/nvim-highlight-colors",
	-- "MagicDuck/grug-far.nvim"
	-- "stevearc/overseer.nvim"
	-- "tmsvg/pear-tree",
	{
		"mcauley-penney/visual-whitespace.nvim",
		opts = {
			highlight = { link = "Visual" },
			space_char = " ",
			tab_char = "→",
			nl_char = "↲",
			cr_char = "←",
		},
	},

	-- File management and navigation
	"ibhagwan/fzf-lua",
	"stevearc/oil.nvim",

	-- Git integration
	"lewis6991/gitsigns.nvim",
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },

	-- Utility and enhancement
	"itchyny/calendar.vim",
	"takac/vim-hardtime",
	"nacro90/numb.nvim",
	"rmagatti/auto-session",
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
			---@module 'render-markdown'
			---@type render.md.UserConfig
			opts = {},
		},
	},
	{
		"andrewferrier/debugprint.nvim",
		dependencies = {
			"echasnovski/mini.nvim", -- Needed for :ToggleCommentDebugPrints (not needed for NeoVim 0.10+)
		},
	},

	-- Specific tools
	"vimwiki/vimwiki",
	"luk400/vim-jukit",
	"benlubas/molten-nvim",
}, {})

require("debugprint").setup({})
require("p-comp")
require("p-mason")
require("p-lsp")
require("p-conform")
require("p-lspkind")
require("wiki")
require("nvim-highlight-colors").setup({})

require("render-markdown").setup({
	file_types = { "markdown", "vimwiki" },
})
vim.treesitter.language.register("markdown", "vimwiki")

require("colorscheme")
require("treesitter")
require("colorizer")
require("sandwich")
require("yoink")
require("Comment").setup()
require("treesitter-context").setup({ max_linex = 0, multiline_threshold = 1, separator = nil, zindex = 20 })
vim.cmd([[
hi TreesitterContextBottom gui=none guisp=Grey
hi TreesitterContextLineNumberBottom gui=none guisp=Grey
]])
require("fzf")
require("git")
require("textobj")
require("numb").setup()
require("auto-session").setup({ log_level = "error" })
require("jukit")
require("oil-setup")
require("bufferline-setup")
require("treesj").setup({ use_default_keymaps = false })

vim.g["hardtime_default_on"] = 0

vim.g["clever_f_ignore_case"] = 1
vim.g["clever_f_fix_key_direction"] = 1
vim.g["clever_f_use_migemo"] = 1

vim.g["pear_tree_smart_openers"] = 1
vim.g["pear_tree_smart_closers"] = 1
vim.g["pear_tree_smart_backspace"] = 1

vim.api.nvim_set_keymap("n", "<cr>", "<cmd>Pounce<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>j", require("treesj").toggle)
vim.keymap.set("n", "<leader>J", function()
	require("treesj").toggle({ split = { recursive = true } })
end)

vim.opt.fillchars:append({ diff = "╱" })
vim.cmd([[
nmap <space>x :w<CR> <Plug>JupyterExecute
nmap <space>X :w<CR> <Plug>JupyterExecuteAll
nmap <space>r <Plug>JupyterRestart

autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
autocmd VimLeave * call system("tmux set-option -w automatic-rename on")
autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
set title

set laststatus=0
]])

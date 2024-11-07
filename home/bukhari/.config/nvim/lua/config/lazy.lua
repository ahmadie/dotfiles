-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Set options (from options.lua)
local opt = vim.opt

opt.backup = false
opt.clipboard:append("unnamed,unnamedplus")
opt.hlsearch = true
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.signcolumn = "yes:2"
opt.cursorline = true
opt.fillchars = { eob = " " }
opt.mouse:append("a")
opt.ignorecase = true
opt.smartcase = true
opt.smarttab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.autoread = true
opt.termguicolors = true
opt.scrolloff = 10
opt.sidescrolloff = 10
opt.undofile = true
opt.encoding = "UTF-8"
opt.foldnestmax = 2
opt.foldlevel = 20
opt.swapfile = false
opt.incsearch = true
opt.showmode = false
opt.virtualedit = "onemore,block"
opt.background = "dark"
opt.hidden = true
opt.wrap = true
opt.cmdheight = 0
opt.shortmess:append("s")
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.g.have_nerd_font = true
vim.o.laststatus = 0

vim.cmd([[
  " adjust scroll height to 1/3 of screen
  au BufEnter * execute "set scroll=" . winheight('.') / 3
  au VimResized * execute "set scroll=" . winheight('.') / 3
]])

-- Set keymaps (from keymaps.lua)
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "H", "^", { noremap = true, silent = true })
keymap("n", "L", "$", { noremap = true, silent = true })
keymap("x", "H", "^", { noremap = true, silent = true })
keymap("x", "L", "$", { noremap = true, silent = true })
keymap("o", "H", "^", { noremap = true, silent = true })
keymap("o", "L", "$", { noremap = true, silent = true })

keymap("n", "<leader>l", "<c-w>l", { noremap = true, silent = true })
keymap("n", "<leader>h", "<c-w>h", { noremap = true, silent = true })
keymap("n", "<leader>k", "<c-w>k", { noremap = true, silent = true })
keymap("n", "<leader>j", "<c-w>j", { noremap = true, silent = true })

keymap("n", "<leader><leader>l", "<c-w>L", { noremap = true, silent = true })
keymap("n", "<leader><leader>h", "<c-w>H", { noremap = true, silent = true })
keymap("n", "<leader><leader>k", "<c-w>K", { noremap = true, silent = true })
keymap("n", "<leader><leader>j", "<c-w>J", { noremap = true, silent = true })

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "catpucchin" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

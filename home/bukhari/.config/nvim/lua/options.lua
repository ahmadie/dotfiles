local opt = vim.opt

opt.backup = false
opt.clipboard:append("unnamed,unnamedplus")
opt.hlsearch = true
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.signcolumn = "yes:1"
opt.numberwidth = 1
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

vim.cmd([[
  " adjust scroll height to 1/3 of screen
  au BufEnter * execute "set scroll=" . winheight('.') / 3
  au VimResized * execute "set scroll=" . winheight('.') / 3
]])

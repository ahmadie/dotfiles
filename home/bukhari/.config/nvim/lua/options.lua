local options = {
  backup = false,
  clipboard = "unnamed,unnamedplus",
  hlsearch = true, 
  number = true,
  relativenumber = true,
  termguicolors = true,
  signcolumn = "yes:2",
  cursorline = true,
  fillchars = "eob: ",
  mouse = "a",
  ignorecase = true,
  smartcase = true,
  smarttab = true,
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  scrolloff = 10,
  undofile = true,
  encoding= "UTF-8",
  foldnestmax = 2,
  foldlevel = 20,
  swapfile = false,
  incsearch = true,
  showmode = false,
  virtualedit = 'onemore,block',
  background = 'dark',
  hidden = true,
  wrap = true,
  cmdheight = 0
}

-- vim.opt.wop:sub('pum')
vim.opt.shortmess:append('s')

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd [[
  " adjust scroll height to 1/3 of screen
  au BufEnter * execute "set scroll=" . winheight('.') / 3
  au VimResized * execute "set scroll=" . winheight('.') / 3
]]

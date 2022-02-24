vim.cmd [[
augroup packer_user_config
	autocmd!
	autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

function exec_setup(name)
  require(name).setup()
end

function load_setup(name)
  return string.format('require("./%s")', name)
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use { 'takac/vim-hardtime', 
   config = function() vim.g['hardtime_default_on'] = 1 end }
  use { 'neoclide/coc.nvim',
    branch = 'release' }
  use { 'ayu-theme/ayu-vim',
    config = load_setup('colorscheme') }
  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = load_setup('treesitter') }
  use { 'vifm/vifm.vim',
    config = function() vim.api.nvim_set_keymap('n', '<leader>n', ':TabVifm:<cr>', { noremap = true, silent = true }) end }
  use { 'norcalli/nvim-colorizer.lua',
    config = exec_setup('colorizer') }
  use { 'machakann/vim-sandwich',
    config = load_setup('sandwich') }
  use 'wellle/targets.vim'
  use 'svermeulen/vim-yoink'
  use 'svermeulen/vim-cutlass'
  use { 'svermeulen/vim-subversive',
    config = load_setup('yoink') }
  use { 'numToStr/Comment.nvim',
    config = exec_setup('Comment') }
  use 'machakann/vim-highlightedyank'
  use { 'ibhagwan/fzf-lua',
    config = load_setup('fzf') }
  use { 'rhysd/clever-f.vim',
    config = function()
      vim.g['clever_f_ignore_case'] = 1
      vim.g['clever_f_fix_key_direction'] = 1
    end }
  use { 'rlane/pounce.nvim',
    config = function() vim.api.nvim_set_keymap('n', '<cr>', "<cmd>Pounce<CR>", { noremap = true, silent = true }) end }
  use { 'tmsvg/pear-tree', 
    config = function() 
      vim.g['pear_tree_smart_openers'] = 1
      vim.g['pear_tree_smart_closers'] = 1
      vim.g['pear_tree_smart_backspace'] = 1 
    end }
  --[[ use { "beauwilliams/focus.nvim", 
    config = function() require("focus").setup() end } ]]
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

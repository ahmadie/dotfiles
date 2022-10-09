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
   config = function() vim.g['hardtime_default_on'] = 0 end }
  use { 'neoclide/coc.nvim',
    branch = 'release' }
  use { 'Shatur/neovim-ayu',
    config = load_setup('colorscheme') }
  use { 'nvim-lualine/lualine.nvim',
    config = function() 
      require('lualine').setup({
        options = {
          theme = 'ayu_mirage',
          section_separators = '',
          component_separators = ''
        },
    }) end }
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
  -- use { "beauwilliams/focus.nvim",
    -- config = load_setup('foc') }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use { 'kana/vim-textobj-user' }
  use { 'kana/vim-textobj-line' }
  use { 'ColinKennedy/vim-indent-object' }
  use { 'Julian/vim-textobj-variable-segment' }
  use { 'tkhren/vim-textobj-numeral', 
    config = load_setup('textobj') }
  use { 'catppuccin/nvim', as = 'catppuccin'}
  use 'andymass/vim-matchup'
  -- use { 'sunjon/shade.nvim',
  --   config = function() require'shade'.setup({ overlay_opacity = 50, opacity_step = 1}) end }
  use { 'crispgm/nvim-tabline',
      config = function() require('tabline').setup({}) end }
  -- use { 'rafcamlet/tabline-framework.nvim',
  --   config = load_setup('tabline') }
  use 'kyazdani42/nvim-web-devicons'
  use { 'nacro90/numb.nvim', 
    config = exec_setup('numb') }
  use { 'lewis6991/gitsigns.nvim',
    config = load_setup('git'),
  }
  use { 'glepnir/indent-guides.nvim',
    config = function() 
      require('indent_guides').setup({
      indent_start_level = 2,
      even_colors = { fg='#FFFFFF', bg='#252636'},
      odd_colors = { fg='#FFFFFF', bg='#252636'},
    }) end }
  -- use { 'lukas-reineke/indent-blankline.nvim', 
  --   config = load_setup('indent') }
  -- use 'romgrk/nvim-treesitter-context'
  use {'ggVGc/vim-fuzzysearch',
    config = function() 
      vim.g['fuzzysearch_match_spaces'] = 1 
      vim.g['fuzzysearch_prompt'] = '/'
      vim.g['fuzzysearch_ignorecase'] = 1 
    end }
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)



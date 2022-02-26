  require'fzf-lua'.setup {
      border           = "single",
      grep = {
        prompt            = ' ',
        multiprocess      = true,           -- run command in a separate process
        git_icons         = true,           -- show git icons?
        file_icons        = true,           -- show file icons?
        color_icons       = true,           -- colorize file|git icons
        rg_opts           = "--type-add='project:*.{js,jsx,vue,ts,tsx,vim,rs,dart,py}' -g='!renderer.dev.js' --column --line-number --no-heading --color=always --smart-case",
      },
      files = {
          prompt            = ' ',
      },
      oldfiles = {
          prompt            = ' ',
      },
      lines = {
          prompt            = ' ',
      },
      blines = {
          prompt            = ' ',
          fzf_opts = {
                -- hide filename, tiebreak by line no.
                ['--delimiter'] = "'[\\]:]'",
                ["--with-nth"]  = '3..',
                -- ["--tiebreak"]  = 'index',
          },
          winopts = {
            fullscreen = true,
            height = 0.99,
            width = 1,
            border = 'single',
            preview = {
              border = 'none',
              layout = 'vertical',
              vertical       = 'up:80%', 
              title = false,
              winopts = {
                scrollbar = false,
                signcolumn = 'yes:2'
              }
            },
          },
      },
      buffers = {
          prompt            = ' ',
      },
      tabs = {
          prompt            = ' ',
      },
      git = {
        files = {
          prompt            = ' ',
        },
      },
      winopts = {
        height           = 0.95,
        width            = 0.95,
        row              = 0.35,
        col              = 0.5,
        hl = {
              border            = 'Identifier',
              -- builtin preview only
              cursor            = 'Error',
              -- cursorline        = 'DiffAdd',
              search            = 'Search',
              -- title          = 'Normal',
              -- scrollbar_f    = 'PmenuThumb',
              -- scrollbar_e    = 'PmenuSbar',
            },
      },
      fzf_opts = {
        ['--marker']      = '→',
        ['--color']       = 'fg:#9aedfe,bg:-1,hl:#f50062:bold',
        ['--color']       = 'fg+:#FFFFFF',
        ['--color']       = 'info:#f50062,prompt:-1,pointer:#af5fff',
        ['--color']       = 'marker:#f50062,spinner:#af5fff,header:#525252',
        ['--color']       = 'border:#57c7ff',
        ['--color']       = 'pointer:reverse,prompt:#57c7ff,input:159',
        ['--color']       = 'fg+:bold,hl+:#f50062:bold',
        ['--prompt']      = ' ',
        ['--info']        = 'inline',
        ['--height']      = '100%',
        ['--layout']      = 'reverse-list',
        ['--preview-window'] = 'sharp',
        ['--pointer'] = '⠀'
        },
      }


vim.api.nvim_set_keymap('n', '<leader>/', "<cmd>lua require('fzf-lua').blines()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><cr>', "<cmd>lua require('fzf-lua').blines()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>i', "<cmd>lua require('fzf-lua').lines()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>E', "<cmd>lua require('fzf-lua').git_files()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>o', "<cmd>lua require('fzf-lua').oldfiles()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', "<cmd>lua require('fzf-lua').grep()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>F', "<cmd>lua require('fzf-lua').grep_project()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t', "<cmd>lua require('fzf-lua').tabs()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', "<cmd>lua require('fzf-lua').buffers()<CR>", { noremap = true, silent = true })

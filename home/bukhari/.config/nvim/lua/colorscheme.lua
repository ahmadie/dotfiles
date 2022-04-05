require('ayu').setup({
    mirage = true,
    overrides = {
      -- Normal = { bg = 'None' },
      SignColumn = { bg = 'None' } 
    }, 
})

require('ayu').colorscheme()
vim.cmd [[
  " to integrate with tmux true-color
  if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  endif

  hi! link DiffChange NONE
  hi! clear DiffChange
  hi! DiffText term=NONE guibg=#d54e53 gui=NONE
  hi! DiffChange term=NONE guibg=#303030 gui=NONE
  hi! DiffAdd term=NONE guibg=#303030 gui=NONE
  hi! DiffDelete term=NONE guifg=#9D4D50 guibg=#303030 gui=NONE
  hi! CocHighlightText guibg=#303030 guifg=#d54e53

  " clear sign
  highlight clear SignColumn

  highlight! PounceAccept term=NONE guifg=black guibg=white gui=NONE
  highlight! PounceGap term=NONE guifg=default guibg=#404040 gui=NONE 
  highlight! PounceMatch  term=NONE guifg=#d54e53 guibg=#404040 gui=NONE
  highlight! PounceAcceptBest  term=NONE guifg=black guibg=yellow gui=NONE
]]


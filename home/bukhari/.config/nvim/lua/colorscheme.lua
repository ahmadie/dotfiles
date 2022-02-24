vim.cmd [[

  " to integrate with tmux true-color
  if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  endif

  " let ayucolor = "light"  " for light version of theme
  let ayucolor = "mirage" " for mirage version of theme
  " let ayucolor = "dark"   " for dark version of theme

  colorscheme ayu

  hi! link DiffChange NONE
  hi! clear DiffChange
  hi! DiffText term=NONE guibg=#d54e53 gui=NONE
  hi! DiffChange term=NONE guibg=#303030 gui=NONE
  hi! DiffAdd term=NONE guibg=#303030 gui=NONE
  hi! DiffDelete term=NONE guifg=#9D4D50 guibg=#303030 gui=NONE
  hi! CocHighlightText guibg=#303030 guifg=#d54e53

  " clear sign
  highlight clear SignColumn
]]

vim.cmd [[
  set nocompatible
  filetype plugin on
  syntax on

  nmap <leader>ww :VimwikiTabIndex 1<CR>
  nmap <leader><CR> <Plug>VimwikiFollowLink
  vmap <leader><CR> <Plug>VimwikiFollowLink
  nmap <leader>wt <Plug>VimwikiToggleListItem
  nmap <Backspace> <Plug>VimwikiGoBackLink
]]

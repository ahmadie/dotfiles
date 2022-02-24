vim.g['yoinkSyncSystemClipboardOnFocus'] = 0
vim.g['yoinkSavePersistently'] = 1
vim.g['yoinkIncludeDeleteOperations'] = 1
vim.g['subversivePromptWithActualCommand'] = 1


vim.api.nvim_set_keymap('n', 'm', 'd', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'm', 'd', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'mm', 'dd', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'M', 'D', { noremap = true, silent = true })

vim.cmd [[
  " Make Y yank till end of line. Super useful. This is the most important thing in this file
  nnoremap Y y$

  vnoremap y "+y

  set shada=!,'100,<50,s10,h

  nmap <c-n> <plug>(YoinkPostPasteSwapBack)
  nmap <c-p> <plug>(YoinkPostPasteSwapForward)

  nmap [y <plug>(YoinkRotateBack)
  nmap ]y <plug>(YoinkRotateForward)

  " nmap <expr> p yoink#canSwap() ? '<plug>(YoinkPostPasteSwapBack)' : '<plug>(YoinkPaste_p)'
  " nmap <expr> P yoink#canSwap() ? '<plug>(YoinkPostPasteSwapForward)' : '<plug>(YoinkPaste_P)'
  nmap p <plug>(YoinkPaste_p)
  nmap P <plug>(YoinkPaste_P)

  " s for substitute
  nmap gr <plug>(SubversiveSubstitute)
  nmap grr <plug>(SubversiveSubstituteLine)
  nmap gR <plug>(SubversiveSubstituteToEndOfLine)
  xmap p <plug>(SubversiveSubstitute)

  nmap <leader>s <plug>(SubversiveSubstituteRange)
  xmap <leader>s <plug>(SubversiveSubstituteRange)

  nmap <leader>ss <plug>(SubversiveSubstituteWordRange)
]]

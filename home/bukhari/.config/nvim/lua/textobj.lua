vim.cmd [[
  let g:indent_object_no_default_key_mappings = '1'
  " Mappings including line below.
  onoremap <silent>ii :<C-u>cal HandleTextObjectMapping(1, 0, 0, [line("."), line("."), col("."), col(".")])<CR>
  vnoremap <silent>ii :<C-u>cal HandleTextObjectMapping(1, 0, 1, [line("'<"), line("'>"), col("'<"), col("'>")])<CR><Esc>gv

  " Mappings including line below.
  onoremap <silent>ai :<C-u>cal HandleTextObjectMapping(0, 1, 0, [line("."), line("."), col("."), col(".")])<CR>
  vnoremap <silent>ai :<C-u>cal HandleTextObjectMapping(0, 1, 1, [line("'<"), line("'>"), col("'<"), col("'>")])<CR><Esc>gv

  onoremap <silent>aI :<C-u>cal HandleTextObjectMapping(0, 0, 0, [line("."), line("."), col("."), col(".")])<CR>
  vnoremap <silent>aI :<C-u>cal HandleTextObjectMapping(0, 0, 1, [line("'<"), line("'>"), col("'<"), col("'>")])<CR><Esc>gv


  let g:textobj_line_no_default_key_mappings = 1

  vmap <silent> al <Plug>(textobj-line-a)
  omap <silent> al <Plug>(textobj-line-a)
  vmap <silent> il <Plug>(textobj-line-i)
  omap <silent> il <Plug>(textobj-line-i)

]]

vim.cmd [[

  " autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()
  " let g:airline_section_z=''
  " let g:airline_section_y=''
  let g:airline_section_x=''
  let g:airline_skip_empty_sections = 1
  let g:airline#extensions#tabline#formatter = 'jsformatter'
  " let g:airline_powerline_fonts = 1
  let g:airline#extensions#coc#enabled = 1
  let g:airline#extensions#xkblayout#enabled = 0
  let g:airline#extensions#fugitiveline#enabled = 1
  let g:airline#extensions#keymap#enabled = 0
  let g:airline#extensions#term#enabled = 0
  let g:airline#extensions#quickfix#enabled = 1
  let g:airline#extensions#hunks#enabled = 1
  let g:airline#extensions#netrw#enabled = 0
  let g:airline#extensions#po#enabled = 0
  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#branch#format = 2
  let g:airline#extensions#whitespace#enabled = 0
  let g:airline#extensions#wordcount#enabled = 0
  let g:loaded_netrw       = 1
  let g:loaded_netrwPlugin = 1
  let g:airline#extensions#tabline#buffer_nr_show = 0
  " let g:airline_theme='base16_snazzy'
  let g:airline_theme='ayu'

  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_tabs = 0
  let g:airline#extensions#tabline#show_tab_count = 0
  let g:workspace#vim#airline#enable = 1
  "}}}
  " configure the minimum number of tabs needed to show the tabline.
  let g:airline#extensions#tabline#tab_min_count = 2

  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#show_tab_nr = 1
  let g:airline#extensions#tabline#buffers_label = ''
  let g:airline#extensions#tabline#tab_nr_type = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail_improved' " d/file.txt
  let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
  let g:airline#extensions#tabline#buffer_idx_mode = 1 " buffer number
]]

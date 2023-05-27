vim.cmd [[
let g:jukit_in_style = 4
let g:jukit_show_prompt = 0
let g:jukit_terminal = 'nvimterm'
let g:jukit_mappings = 0
nnoremap <leader>ts :call jukit#splits#output()<cr>
nnoremap <leader><space> :call jukit#send#section(0)<cr>
nnoremap <leader>cc :call jukit#send#until_current_section()<cr>
nnoremap <leader>co :call jukit#cells#create_below(0)<cr>
nnoremap <leader>cO :call jukit#cells#create_above(0)<cr>
nnoremap <leader>ct :call jukit#cells#create_below(1)<cr>
nnoremap <leader>cT :call jukit#cells#create_above(1)<cr>
nnoremap <leader>cd :call jukit#cells#delete()<cr>
nnoremap <c-j> :call jukit#cells#jump_to_next_cell()<cr>
nnoremap <c-k> :call jukit#cells#jump_to_previous_cell()<cr>
nnoremap <leader>hs :call jukit#splits#history()<cr>
vnoremap <leader><leader> :<C-U>call jukit#send#selection()<cr>
]]

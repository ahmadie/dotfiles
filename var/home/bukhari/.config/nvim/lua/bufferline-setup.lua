local configs = require("bufferline")

configs.setup({
        options = {
            mode = "tabs", -- set to "tabs" to only show tabpages instead
            numbers = function(opts)
              return string.format('%s', opts.ordinal)
            end,
            separator_style = {"", ""},
            show_close_icon = false,
            show_buffer_close_icons = false,
            show_tab_indicators = false,
            color_icons = false,
            enforce_regular_tabs = false,
            max_name_length = 30,
            indicator = {
              icon = '', -- this should be omitted if indicator style is not 'icon'
              style = 'none',
            },
        }
      })

vim.cmd [[
nnoremap <silent><Tab> :BufferLineCycleNext<CR>
nnoremap <silent><S-Tab> :BufferLineCyclePrev<CR>
nnoremap <silent><leader>1 :tabm 0<CR>
nnoremap <silent><leader>2 :tabm 2<CR>
nnoremap <silent><leader>3 :tabm 3<CR>
nnoremap <silent><leader>4 :tabm 4<CR>
nnoremap <silent><leader>5 :tabm 5<CR>
nnoremap <silent><leader>6 :tabm 6<CR>
nnoremap <silent><leader>7 :tabm 7<CR>
nnoremap <silent><leader>8 :tabm 8<CR>
nnoremap <silent><leader>9 :tabm 9<CR>
]]

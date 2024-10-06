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
            color_icons = true,
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
nnoremap <silent><leader>1 <cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <cmd>BufferLineGoToBuffer 9<CR>
]]

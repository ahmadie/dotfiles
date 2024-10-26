return {
    "kana/vim-textobj-line",
    dependencies = { "kana/vim-textobj-user" },
    init = function()
        vim.g.textobj_line_no_default_key_mappings = 1
        vim.cmd([[
            vmap <silent> al <Plug>(textobj-line-a)
            omap <silent> al <Plug>(textobj-line-a)
            vmap <silent> il <Plug>(textobj-line-i)
            omap <silent> il <Plug>(textobj-line-i)
        ]])
    end
}

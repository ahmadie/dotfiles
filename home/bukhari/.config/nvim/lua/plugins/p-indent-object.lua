return {
    "ColinKennedy/vim-indent-object",
    dependencies = { "kana/vim-textobj-user" },
    init = function()
        vim.g.indent_object_no_default_key_mappings = 1
        vim.cmd([[
            onoremap <silent>ii :<C-u>cal HandleTextObjectMapping(1, 0, 0, [line("."), line("."), col("."), col(".")])<CR>
            vnoremap <silent>ii :<C-u>cal HandleTextObjectMapping(1, 0, 1, [line("'<"), line("'>"), col("'<"), col("'>")])<CR><Esc>gv
            onoremap <silent>ai :<C-u>cal HandleTextObjectMapping(0, 1, 0, [line("."), line("."), col("."), col(".")])<CR>
            vnoremap <silent>ai :<C-u>cal HandleTextObjectMapping(0, 1, 1, [line("'<"), line("'>"), col("'<"), col("'>")])<CR><Esc>gv
            onoremap <silent>aI :<C-u>cal HandleTextObjectMapping(0, 0, 0, [line("."), line("."), col("."), col(".")])<CR>
            vnoremap <silent>aI :<C-u>cal HandleTextObjectMapping(0, 0, 1, [line("'<"), line("'>"), col("'<"), col("'>")])<CR><Esc>gv
        ]])
    end
}

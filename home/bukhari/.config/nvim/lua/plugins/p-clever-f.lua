return {
    "rhysd/clever-f.vim",
    event = "VeryLazy",
    init = function()
        vim.g["clever_f_ignore_case"] = 1
        vim.g["clever_f_fix_key_direction"] = 1
        vim.g["clever_f_use_migemo"] = 1
    end,
}

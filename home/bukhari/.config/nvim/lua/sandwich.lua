vim.g["sandwich_no_default_key_mappings"] = 1
vim.g["textobj_sandwich_no_default_key_mapping"] = 1

vim.api.nvim_set_keymap("n", "sd", "<Plug>(operator-sandwich-delete)A", { silent = true })
vim.api.nvim_set_keymap("n", "sr", "<Plug>(operator-sandwich-replace)A", { silent = true })
vim.api.nvim_set_keymap("n", "sa", "<Plug>(operator-sandwich-add)", { silent = true })

vim.api.nvim_set_keymap("n", "s", "<Nop>", { silent = true })
vim.api.nvim_set_keymap("x", "s", "<Nop>", { silent = true })

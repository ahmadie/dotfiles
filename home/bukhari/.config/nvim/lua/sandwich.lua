vim.g['sandwich_no_default_key_mappings'] = 1
vim.g['textobj_sandwich_no_default_key_mapping'] = 1
vim.g['targets_seekRanges'] = 'cc cr cb cB lc ac Ac lr rr lb ar ab lB Ar aB Ab AB rb rB bb bB BB'

vim.api.nvim_set_keymap("n", "sd", "<Plug>(operator-sandwich-delete)A", { silent = true })
vim.api.nvim_set_keymap("n", "sr", "<Plug>(operator-sandwich-replace)A", { silent = true })
vim.api.nvim_set_keymap("n", "sa", "<Plug>(operator-sandwich-add)", { silent = true })

vim.api.nvim_set_keymap("n", "s", "<Nop>", { silent = true })
vim.api.nvim_set_keymap("x", "s", "<Nop>", { silent = true })

vim.api.nvim_set_keymap("o", "q", "iq", { silent = true })
vim.api.nvim_set_keymap("o", "b", "ib", { silent = true })

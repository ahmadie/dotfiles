-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "H", "^", { noremap = true, silent = true })
keymap("n", "L", "$", { noremap = true, silent = true })
keymap("x", "H", "^", { noremap = true, silent = true })
keymap("x", "L", "$", { noremap = true, silent = true })
keymap("o", "H", "^", { noremap = true, silent = true })
keymap("o", "L", "$", { noremap = true, silent = true })

keymap("n", "<leader>l", "<c-w>l", { noremap = true, silent = true })
keymap("n", "<leader>h", "<c-w>h", { noremap = true, silent = true })
keymap("n", "<leader>k", "<c-w>k", { noremap = true, silent = true })
keymap("n", "<leader>j", "<c-w>j", { noremap = true, silent = true })

keymap("n", "<leader><leader>l", "<c-w>L", { noremap = true, silent = true })
keymap("n", "<leader><leader>h", "<c-w>H", { noremap = true, silent = true })
keymap("n", "<leader><leader>k", "<c-w>K", { noremap = true, silent = true })
keymap("n", "<leader><leader>j", "<c-w>J", { noremap = true, silent = true })

-- keymap("n", ":", ";", { noremap = true })
keymap("n", ";", ":", { noremap = true })
-- keymap("v", ":", ";", { noremap = true })
keymap("v", ";", ":", { noremap = true })

keymap("n", "<leader>1", "<cmd>tabn 1<cr>", { noremap = true, silent = true })
keymap("n", "<leader>2", "<cmd>tabn 2<cr>", { noremap = true, silent = true })
keymap("n", "<leader>3", "<cmd>tabn 3<cr>", { noremap = true, silent = true })
keymap("n", "<leader>4", "<cmd>tabn 4<cr>", { noremap = true, silent = true })
keymap("n", "<leader>5", "<cmd>tabn 5<cr>", { noremap = true, silent = true })
keymap("n", "<leader>6", "<cmd>tabn 6<cr>", { noremap = true, silent = true })
keymap("n", "<leader>7", "<cmd>tabn 7<cr>", { noremap = true, silent = true })
keymap("n", "<leader>8", "<cmd>tabn 8<cr>", { noremap = true, silent = true })
keymap("n", "<leader>9", "<cmd>tabn 9<cr>", { noremap = true, silent = true })

keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

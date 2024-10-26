return {
	"luk400/vim-jukit",
	init = function()
		vim.g.jukit_in_style = 4
		vim.g.jukit_show_prompt = 0
		vim.g.jukit_terminal = "nvimterm"
		vim.g.jukit_mappings = 0
	end,
	config = function()
		vim.keymap.set("n", "<leader>ts", ":call jukit#splits#output()<cr>")
		vim.keymap.set("n", "<leader><space>", ":call jukit#send#section(0)<cr>")
		vim.keymap.set("n", "<leader>cc", ":call jukit#send#until_current_section()<cr>")
		vim.keymap.set("n", "<leader>co", ":call jukit#cells#create_below(0)<cr>")
		vim.keymap.set("n", "<leader>cO", ":call jukit#cells#create_above(0)<cr>")
		vim.keymap.set("n", "<leader>ct", ":call jukit#cells#create_below(1)<cr>")
		vim.keymap.set("n", "<leader>cT", ":call jukit#cells#create_above(1)<cr>")
		vim.keymap.set("n", "<leader>cd", ":call jukit#cells#delete()<cr>")
		vim.keymap.set("n", "<C-j>", ":call jukit#cells#jump_to_next_cell()<cr>")
		vim.keymap.set("n", "<C-k>", ":call jukit#cells#jump_to_previous_cell()<cr>")
		vim.keymap.set("n", "<leader>hs", ":call jukit#splits#history()<cr>")
		vim.keymap.set("v", "<leader><leader>", ":<C-U>call jukit#send#selection()<cr>")
		vim.keymap.set("n", "<leader>np", ':call jukit#convert#notebook_convert("jupyter-notebook")<cr>')

		vim.keymap.set("n", "<space>x", ":w<CR><Plug>JupyterExecute")
		vim.keymap.set("n", "<space>X", ":w<CR><Plug>JupyterExecuteAll")
		vim.keymap.set("n", "<space>r", "<Plug>JupyterRestart")
	end,
}

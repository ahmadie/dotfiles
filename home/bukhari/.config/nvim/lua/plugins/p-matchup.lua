return {
	"andymass/vim-matchup",
	config = function()
		require("nvim-treesitter.configs").setup({
			matchup = {
				enable = true,
			},
		})
	end,
}

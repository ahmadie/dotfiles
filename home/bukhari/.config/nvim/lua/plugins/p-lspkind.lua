return {
	"onsails/lspkind.nvim",
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		cmp.setup({
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol",
					maxwidth = 50,
					ellipsis_char = "...",
					show_labelDetails = true,
					before = function(entry, vim_item)
						return vim_item
					end,
				}),
			},
		})
	end,
}

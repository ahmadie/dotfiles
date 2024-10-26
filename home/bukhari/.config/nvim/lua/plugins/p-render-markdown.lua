return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        file_types = { "markdown", "vimwiki" },
    },
    config = function()
        vim.treesitter.language.register("markdown", "vimwiki")
    end,
}

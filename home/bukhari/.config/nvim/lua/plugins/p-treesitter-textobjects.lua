return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]g"] = "@loop.outer",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]G"] = "@loop.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[g"] = "@loop.outer",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[G"] = "@loop.outer",
          },
        },
      },
    })
  end,
}

return {
  "nvim-treesitter/nvim-treesitter-context",
  config = function()
    require("treesitter-context").setup({
      max_lines = 0,
      multiline_threshold = 1,
      separator = nil,
      zindex = 20,
    })
    
    vim.cmd([[
      hi TreesitterContextBottom gui=none guisp=Grey
      hi TreesitterContextLineNumberBottom gui=none guisp=Grey
    ]])
  end,
}

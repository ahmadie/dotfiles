require('oil').setup({
columns = {
    "icon",
    "permissions",
    "size",
    "mtime",
  },
  use_default_keymaps = true,
  keymaps = {
    ["?"] = "actions.show_help",
    ["q"] = "actions.close",
  },
  view_options = {
    show_hidden = true,
    sort = {
      { "ctime", "asc" }
    },
  },
})

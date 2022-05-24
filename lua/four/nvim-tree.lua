-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
local success, nvim_tree = pcall(require, "nvim-tree")
if not success then
  return
end

local config_success, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_success then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  auto_reload_on_write = true,
  disable_netrw = true,
  hijack_cursor = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = true,
  ignore_buffer_on_setup = false,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  update_cwd = true,
  view = {
      width = 30,
      height = 30,
      hide_root_folder = false,
      side = "left",
      preserve_window_proportions = true,
      number = false,
      relativenumber = false,
      signcolumn = "yes",
      mappings = {
          custom_only = false,
          list = {
            { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
            { key = "h", cb = tree_cb "close_node" },
            { key = "v", cb = tree_cb "vsplit" },
          },
      },
  },
  renderer = {
      icons = {
          webdev_colors = true,
      },
  },
  hijack_directories = {
      enable = true,
      auto_open = true,
  },
  ignore_ft_on_setup = {
      "startify",
      "dashboard",
      "alpha",
  },
  diagnostics = {
      enable = true,
      show_on_dirs = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
  },
  git = {
      enable = true,
      ignore = true,
      timeout = 500,
  },
}

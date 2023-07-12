---@type ChadrcConfig 
local M = {}

M.mappings = require 'custom.mappings'
M.plugins = 'custom.plugins'

M.ui = {
  theme = 'catppuccin',

  cheatsheet = {
    theme = "simple"
  },

  telescope = {
    style = "bordered"
  },

  statusline = {
    theme = "vscode_colored"
  },

  tabufline = {
    show_numbers = true,
  }
}

return M

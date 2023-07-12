local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "c_sharp",
        "cpp",
        "css",
        "diff",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "glsl",
        "html",
        "java",
        "javascript",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "python",
        "ruby",
        "swift",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      }
    }
  }
}
return plugins

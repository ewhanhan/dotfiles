return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add tsx and treesitter
    vim.list_extend(opts.ensure_installed, {
      "tsx",
      "typescript",
      "html",
      "css",
      "markdown",
      "javascript",
      "json",
      "lua",
      "regex",
      "yaml",
      "toml",
      "python",
      "bash",
    })
  end,
}

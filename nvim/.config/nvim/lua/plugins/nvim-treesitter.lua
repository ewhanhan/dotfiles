return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add tsx and treesitter
    vim.list_extend(opts.ensure_installed, {
      "tsx",
      "typescript",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "python",
      "vim",
      "yaml",
      "json",
    })
  end,
}

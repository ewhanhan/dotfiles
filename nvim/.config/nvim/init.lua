-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.env.VSCODE then
  vim.g.vscode = true
end

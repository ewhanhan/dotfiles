-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

if vim.env.VSCODE then
  vim.g.vscode = true
end

local opt = vim.opt
local o = vim.o

opt.swap = false
opt.incsearch = true

o.incsearch = true -- starts searching as soon as typing, without enter needed
o.ignorecase = true -- ignore letter case when searching
o.smartcase = true -- case insentive unless capitals used in searcher

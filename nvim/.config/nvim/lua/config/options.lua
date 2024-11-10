-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
vim.g.python3_host_prog = "~/.pyenv/versions/neovim/bin/python"

local opt = vim.opt
local o = vim.o

opt.swapfile = false
opt.incsearch = true

o.incsearch = true -- starts searching as soon as typing, without enter needed
o.ignorecase = true -- ignore letter case when searching
o.smartcase = true -- case insentive unless capitals used in searcher

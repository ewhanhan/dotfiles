-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local g = vim.g
local opt = vim.opt
local o = vim.o
opt.nu = true
opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.softtabstop = 2
opt.autoindent = true
opt.smartindent = true

opt.hlsearch = true
opt.incsearch = true

o.incsearch = true
o.ignorecase = true
o.smartcase = true

opt.swapfile = false
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.confirm = false
opt.list = false
opt.signcolumn = "yes"
opt.termguicolors = true
opt.undofile = true
opt.showmatch = true

vim.cmd([[set termguicolors]])

-- https://github.com/deoplete-plugins/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
g.python3_host_prog = "$HOME/.pyenv/versions/neovim3/bin/python"
g.node_host_prog = "/usr/local/bin/neovim-node-host"

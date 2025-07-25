-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local o = vim.opt

vim.g.ai_cmp = false

-- Swap
o.swapfile = false

-- Text wrapping
o.wrap = true
o.breakindent = true

-- Search
o.ignorecase = true
o.smartcase = true

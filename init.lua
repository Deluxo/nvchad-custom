vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.api.nvim_create_autocmd({"FocusLost", "InsertLeave"}, {
  pattern = {"*"},
  command = "silent! wa",
})

vim.wo.relativenumber = true

require("neogit").setup()

if vim.g.neovide then
  local opacity = 0.75
  vim.o.guifont = "JetBrains Mono:h11"
  vim.g.neovide_window_blurred = false
  vim.g.neovide_transparency = opacity
  vim.g.transparency = 0.65
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.winblend = 50
  vim.g.pumblend = 50

  vim.g.neovide_padding_top = 15
  vim.g.neovide_padding_bottom = 15
  vim.g.neovide_padding_right = 15
  vim.g.neovide_padding_left = 15

  local alpha = function()
    return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
  end

  vim.g.neovide_background_color = "#000000" .. alpha()
  vim.g.neovide_show_border = true
	vim.api.nvim_set_keymap('v', '<sc-c>', '"+y', {noremap = true})
	vim.api.nvim_set_keymap('n', '<sc-v>', 'l"+P', {noremap = true})
	vim.api.nvim_set_keymap('v', '<sc-v>', '"+P', {noremap = true})
	vim.api.nvim_set_keymap('c', '<sc-v>', '<C-o>l<C-o>"+<C-o>P<C-o>l', {noremap = true})
	vim.api.nvim_set_keymap('i', '<sc-v>', '<ESC>l"+Pli', {noremap = true})
	vim.api.nvim_set_keymap('t', '<sc-v>', '<C-\\><C-n>"+Pi', {noremap = true})
end

vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", {fg="#ff9999", bg="#660000"})
vim.api.nvim_set_hl(0, "NeogitDiffDelete", {fg="#cc6666", bg="#660000"})

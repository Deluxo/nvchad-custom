vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
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
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.api.nvim_create_autocmd({"FocusLost"}, {
  pattern = {"*"},
  command = "silent! wa",
})

vim.wo.relativenumber = true

require("neogit").setup()

if vim.g.neovide then
  vim.o.guifont = "JetBrains Mono:h11"
  vim.g.neovide_window_blurred = false
  vim.g.neovide_transparency = 0.8
  vim.g.transparency = 0.8
  vim.g.neovide_hide_mouse_when_typing = true

  vim.g.neovide_padding_top = 15
  vim.g.neovide_padding_bottom = 15
  vim.g.neovide_padding_right = 15
  vim.g.neovide_padding_left = 15

  local alpha = function()
    return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
  end

  vim.g.neovide_background_color = "#000000" .. alpha()
  vim.g.neovide_show_border = true
end

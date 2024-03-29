-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.g.vscode_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets"

-- snipmate format 
--vim.g.snipmate_snippets_path = "your snippets path"

-- lua format 
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/lua_snippets"
vim.opt.relativenumber = true

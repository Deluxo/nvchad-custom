require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

map("n", "<leader>ss", ":%s/<c-r><c-w>//g<Left><Left>", { desc = "Substitute word RegEx"})
map("n", "<leader>s", ":%sno/<c-r><c-w>//g<Left><Left>", { desc = "Substitute word Literally"})

map("v", "<leader>ss", ":s/<c-r><c-w>//g<Left><Left>", { desc = "Substitute word RegEx"})
map("v", "<leader>s", ":sno/<c-r><c-w>//g<Left><Left>", { desc = "Substitute word Literally"})

map("n", "<leader>gs", ":Neogit<CR>", { desc = "Open Neogit"})

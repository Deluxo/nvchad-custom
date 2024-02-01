---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>w"] = { ":w<CR>", "Write buffer", opts = { nowait = false } },
    ["<leader>ww"] = { ":w<CR>:bd<CR>", "Write and delete buffer", opts = { nowait = true } },
    ["<leader>gs"] = { ":Neogit<CR>", "Neogit" },
    ["<leader>ss"] = { ":%s/<c-r><c-w>//g<Left><Left>", "Substitute word RegEx" },
    ["<leader>s"] = { ":%sno/<c-r><c-w>//g<Left><Left>", "Substitute word Literally" },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>se"] = {function() require("scissors").editSnippet() end, "Snippet Edit" },
    ["<leader>fl"] = {function() require("telescope").extensions.live_grep_args.live_grep_args() end, "Find with grep args" },
  },
  v = {
    ["<leader>ss"] = { ":s/<c-r><c-w>//g<Left><Left>", "Substitute word RegEx" },
    ["<leader>s"] = { ":sno/<c-r><c-w>//g<Left><Left>", "Substitute word Literally" },
    [">"] = { ">gv", "indent"},
    ["<leader>sa"] = { function() require("scissors").addNewSnippet() end, "Snippet Add"}
  },
}

return M

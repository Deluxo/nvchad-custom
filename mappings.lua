---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>gs"] = { ":Neogit", "Neogit" },
    ["<leader>ss"] = { ":%s/<c-r><c-w>//g<Left><Left>", "Substitute word RegEx" },
    ["<leader>s"] = { ":%sno/<c-r><c-w>//g<Left><Left>", "Substitute word Literally" },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  v = {
    ["<leader>ss"] = { ":s/<c-r><c-w>//g<Left><Left>", "Substitute word RegEx" },
    ["<leader>s"] = { ":sno/<c-r><c-w>//g<Left><Left>", "Substitute word Literally" },
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

return M

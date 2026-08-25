require("toggleterm").setup({
  open_mapping = [[<c-\>]],
  shade_terminals = false,
  shell = "zsh --login",
  direction = "float",
  float_opts = {
    border = "curved",
    width = 120,
    height = 30,
  },
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  direction = "float",
  float_opts = {
    border = "curved",
  },
  on_open = function(term)
    vim.cmd("startinsert!")
  end,
})

vim.keymap.set("n", "<leader>lg", function()
  lazygit:toggle()
end, { desc = "Toggle Lazygit" })

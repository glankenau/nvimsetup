return {
  "akinsho/toggleterm.nvim",
  keys = {
    { "<c-\\>", desc = "Toggle terminal" },
    { "<c-/>", "<cmd>ToggleTerm<cr>", mode = { "n", "t" }, desc = "Toggle terminal" },
  },
  cmd = { "ToggleTerm", "TermExec" },
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      shade_terminals = false,
      -- add --login so ~/.zprofile is loaded
      -- https://vi.stackexchange.com/questions/16019/neovim-terminal-not-reading-bash-profile/16021#16021
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
  end,
}

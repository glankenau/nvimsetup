-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>cf", "va{Vy", { desc = "Copies entire function in curly-based languages" })
vim.keymap.set("n", "<leader>xf", "va{Vd", { desc = "Cuts entire function in curly-based languages" })

function ColorMyPencils(color)
    --color = color or "rose-pine"
    color = color or "everforest"
    vim.o.background = "dark"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "#44415a" })
	vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#44415a" })
end

ColorMyPencils()

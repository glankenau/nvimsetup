-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', branch = 'master',
	  -- or
	  requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use('nvim-treesitter/nvim-treesitter', {run= ':TSUpdate'})
  use('nvim-lua/plenary.nvim')
  use{
	  "ThePrimeAgen/harpoon",
	  branch="harpoon2",
	  requires={ { "nvim-lua/plenary.nvim" } }
  }

  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  use {"akinsho/toggleterm.nvim", branch = 'main'}

  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'L3MON4D3/LuaSnip'}
  use {'saadparwaiz1/cmp_luasnip'}
end)

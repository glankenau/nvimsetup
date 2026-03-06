local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  }),
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('luals', {
  cmd = {'lua-language-server'},
  filetypes = {'lua'},
  root_markers = {'.luarc.json', '.luarc.jsonc'},
  capabilities = capabilities,
})

vim.lsp.config('pylsp', {
  cmd = {'pylsp'},
  filetypes = {'python'},
  root_markers = {'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git'},
  capabilities = capabilities,
})

vim.lsp.config('yamlls', {
  cmd = {'yaml-language-server', '--stdio'},
  filetypes = {'yaml', 'yaml.docker-compose'},
  root_markers = {'.git'},
  capabilities = capabilities,
})

vim.lsp.config('solargraph', {
  cmd = {'solargraph', 'stdio'},
  filetypes = {'ruby'},
  root_markers = {'Gemfile', '.git'},
  capabilities = capabilities,
})

vim.lsp.config('rust_analyzer', {
  cmd = {'rust-analyzer'},
  filetypes = {'rust'},
  root_markers = {'Cargo.toml', 'Cargo.lock'},
  capabilities = capabilities,
})

vim.lsp.enable('luals')
vim.lsp.enable('pylsp')
vim.lsp.enable('yamlls')
vim.lsp.enable('solargraph')
vim.lsp.enable('rust_analyzer')

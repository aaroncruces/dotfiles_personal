local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls',
  --  'phpactor',     -- it is said to be better, wont autoformat code
  'intelephense', -- it can autoformat code
  'gopls',
  'jsonls',
  'bashls',
  -- 'golangci_lint_ls', --wont work in single file mode. it needs a mod file
  -- 'sqls', -- deprecated
  -- 'sqlls', --doesnt autocomplete nor autoformats
})

lsp.setup_servers({
  'tsserver',
  'eslint',
  --  'phpactor',
  'intelephense',
  'gopls',
  'jsonls',
  'bashls',
  -- 'golangci_lint_ls', --wont work in single file mode. it needs a mod file
  -- 'sqls', -- deprecated
  --  'sqlls',
})


local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lspconfig.eslint.setup({
  --- ...
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})


lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    -- ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<tab>'] = cmp.mapping.confirm({ select = false }),

    -- Ctrl+Space to trigger completion menu
    -- ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }
})

-- autoformat on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]


local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

--
-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  }
})



--
-- -- lsp-config.lua
--
-- -- Learn the keybindings, see :help lsp-zero-keybindings
-- -- Learn to configure LSP servers, see :help lsp-zero-api-showcase
-- local lsp = require('lsp-zero')
-- lsp.preset('recommended')
--
-- -- (Optional) Configure lua language server for neovim
-- lsp.nvim_workspace()

-- local lsp = require('lsp-zero').preset({})
--
-- lsp.on_attach(function(client, bufnr)
--   lsp.default_keymaps({buffer = bufnr})
-- end)
--
-- --
-- -- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
--
--
-- lsp.setup()


-- local cmp = require('cmp')
-- local cmp_action = require('lsp-zero').cmp_action()
--
-- cmp.setup({
--   mapping = {
--     ['<CR>'] = cmp.mapping.confirm({select = false}),
--     ['<Tab>'] = cmp_action.luasnip_supertab(),
--     ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
--   }
-- })

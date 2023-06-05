vim.g.codeium_no_map_tab = 1
vim.keymap.set('i', '<leader><Tab>', function () return vim.fn['codeium#Accept']() end, { expr = true })


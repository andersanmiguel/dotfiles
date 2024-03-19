vim.g.copilot_assume_mapped = true
vim.keymap.set('i', '<leader><Tab>', 'copilot#Accept("<CR>")', { expr = true, silent = true, replace_keycodes = false })


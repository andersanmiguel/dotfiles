vim.keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>")
require('nvim-tree').setup({
    actions =  {
        open_file = {
            window_picker = {
                enable = false
            }
        }
    }
})

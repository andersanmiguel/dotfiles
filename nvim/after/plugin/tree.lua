vim.keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>")
require('nvim-tree').setup({
    update_focused_file = {
        enable = true,
    },
    actions =  {
        open_file = {
            window_picker = {
                enable = false
            }
        }
    }
})

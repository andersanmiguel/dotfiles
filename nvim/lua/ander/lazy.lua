require("lazy").setup({
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    'tanvirtin/monokai.nvim',
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    'roflolilolmao/oceanic-next.nvim',
    'RRethy/nvim-base16',
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    'mbbill/undotree',
    'tpope/vim-fugitive',
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    },
    'norcalli/nvim-colorizer.lua',
    'numToStr/Comment.nvim',
    'github/copilot.vim',
    'nvim-tree/nvim-web-devicons',
    'nvim-tree/nvim-tree.lua',
    'nvim-lualine/lualine.nvim',
    {
        "jellydn/CopilotChat.nvim",
        opts = {
            mode = "split",
            prompts = {
                Explain = "Explain how it works.",
                Review = "Review the following code and provide concise suggestions.",
                Tests = "Briefly explain how the selected code works, then generate unit tests using vitest.",
                Refactor = "Refactor the code to improve clarity and readability.",
            },
        },
        build = function()
            vim.defer_fn(function()
                vim.cmd("UpdateRemotePlugins")
                vim.notify("CopilotChat - Updated remote plugins. Please restart Neovim.")
            end, 3000)
        end,
        event = "VeryLazy",
        keys = {
            { "<leader>gce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
            { "<leader>gct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
            { "<leader>gcr", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
            { "<leader>gcR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
        }
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = true
    }
})

return {
    -- AstroNvim theme
    {
        "AstroNvim/astrotheme",
        enabled = true,
        priority = 1000,
        config = function()
            require("astrotheme").setup({
                palette = "astrodark",
                style = {
                    transparent = true, -- ✅ make background transparent
                    italic_comments = true,
                    borders = true,
                },
            })
            vim.cmd.colorscheme("astrodark")
        end,
    },

    {
        "ayu-theme/ayu-vim",
        enabled = true,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("ayu")
        end,
    },

    -- Catppuccin
    {
        "catppuccin/nvim",
        enabled = true,
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin-mocha")
        end,
    },

    -- Tokyonight
    {
        "folke/tokyonight.nvim",
        enabled = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("tokyonight-night")
        end,
    },

    -- Rose Pine
    {
        "rose-pine/neovim",
        enabled = false,
        name = "rose-pine",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("rose-pine")
        end,
    },

    -- Dracula
    {
        "Mofiqul/dracula.nvim",
        enabled = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("dracula")
        end,
    },

    -- Kanagawa
    {
        "rebelot/kanagawa.nvim",
        enabled = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("kanagawa-wave")
        end,
    },

    -- Everforest
    {
        "neanias/everforest-nvim",
        enabled = false,
        version = false,
        priority = 1000,
        config = function()
            require("everforest").setup()
            vim.cmd.colorscheme("everforest")
        end,
    },

    -- Nightfox (includes nordfox, duskfox, etc.)
    {
        "EdenEast/nightfox.nvim",
        enabled = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("nightfox")
        end,
    },

    -- Gruvbox (community version)
    {
        "ellisonleao/gruvbox.nvim",
        enabled = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("gruvbox")
        end,
    },

    -- Monokai Pro
    {
        "loctvl842/monokai-pro.nvim",
        enabled = false,
        priority = 1000,
        config = function()
            require("monokai-pro").setup()
            vim.cmd.colorscheme("monokai-pro")
        end,
    },
}

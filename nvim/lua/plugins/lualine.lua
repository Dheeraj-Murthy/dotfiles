return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "horizon",
                globalstatus = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff" },
                lualine_c = {
                    {
                        "buffers",
                        mode = 2,
                        max_length = vim.o.columns * 1,
                        show_filename_only = true,
                        use_mode_colors = true,
                        symbols = {
                            modified = " ●",
                            alternate_file = "",
                        },
                        highlights = {
                            inactive = { fg = "#C7C7C7" },
                        },
                    },
                },
                lualine_x = { "diagnostics" },
                lualine_y = { "filetype" },
                lualine_z = { "location" },
            },
        })
    end,
}

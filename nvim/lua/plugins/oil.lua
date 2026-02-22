return {
    "stevearc/oil.nvim",
    lazy = false,

    dependencies = {
        { "nvim-mini/mini.icons", opts = {} },
    },
    opts = {
        view_options = {
            show_hidden = true,
        },
        win_options = {
            signcolumn = "no",
        },
        columns = {},
    },
}

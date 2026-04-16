return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    opts = {
        bigfile = { enabled = true },

        dashboard = {
            enabled = true,
            width = 50,
            height = 20,
            pane_gap = 10,

            preset = {
                header = [[
                                                ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
                                                ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
                                                ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
                                                ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
                                                ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
                                                ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
            },
            sections = {
                { section = "header", pane = 1, padding = 0 },

                {
                    pane = 2,
                    section = "terminal",
                    cmd = "print ",
                    height = 8,
                    padding = 0,
                },

                { icon = "  ", title = "Keymaps", section = "keys", gap = 0, padding = 1, indent = 2 },
                { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 3 },
                { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                {
                    pane = 1,
                    icon = " ",
                    title = "Git Status",
                    section = "terminal",
                    enabled = function()
                        return require("snacks").git.get_root() ~= nil
                    end,
                    cmd = "git status --short --branch --renames",
                    height = 3,
                    padding = 4,
                    ttl = 5 * 60,
                    indent = 3,
                },
                { section = "startup", indent = 50 },
            },
        },

        indent = { enabled = false },
        input = { enabled = true },
        notifier = { enabled = true },
        explorer = {
            enabled = true,
            win = {
                list = {
                    keys = {
                        ["f"] = function()
                            local node = require("snacks.explorer").get_node()
                            if not node or not node.path then
                                vim.notify("No file selected", vim.log.levels.WARN)
                                return
                            end
                            vim.fn.jobstart({ "open", "-R", node.path }, { detach = true })
                        end,
                    },
                },
            },
        },
        picker = {
            sources = {
                explorer = {},
            },
        },
        zen = { enabled = false },
        quickfile = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
    },

    keys = {
        {
            "<leader>gg",
            function()
                require("snacks").lazygit()
            end,
            desc = "Lazygit",
        },
    },
    config = function(_, opts)
        require("snacks").setup(opts)

        -- Now override after snacks sets it
    end,
}

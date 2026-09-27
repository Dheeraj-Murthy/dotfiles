return {
    {
        "folke/zen-mode.nvim",
        lazy = false,
        opts = {
            plugins = {
                twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
            },
            -- on_open = function()
            --     require("twilight").disable() -- 💥 force it OFF
            -- end,
        },
    },
    -- Lua
    {
        "folke/twilight.nvim",
        enabled = false,
    },
}

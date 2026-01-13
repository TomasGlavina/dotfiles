return {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        float = {
            border = "single",
        },
        view_options = {
            show_hidden = true,
        },
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
   lazy = false,
}


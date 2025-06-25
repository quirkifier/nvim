return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- ensures it's loaded first
    lazy = false,  -- load immediately
    config = function()
        require("gruvbox").setup({
            contrast = "hard", -- options: soft, medium, hard
            italic = {
                strings = false,
                comments = true,
                operators = false,
                folds = true,
            },
            overrides = {},
        })
        vim.cmd("colorscheme gruvbox")
    end,
}

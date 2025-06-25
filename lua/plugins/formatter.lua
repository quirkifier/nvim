return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
        require("conform").setup({
            format_on_save = {
                timeout_ms = 1000,
                lsp_fallback = true,
            },

            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                json = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                cpp = { "clang-format" },
                c = { "clang-format" },
            },
        })
    end,
}

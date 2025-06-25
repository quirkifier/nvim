return {
    "neovim/nvim-lspconfig",
    ft = { "c", "cpp", "objc", "objcpp" },
    config = function()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup({})
        lspconfig.pyright.setup({})
        lspconfig.bashls.setup({})
        lspconfig.clangd.setup({
            cmd = {
                "clangd",
                "--background-index",         -- index project in the background
                "--clang-tidy",               -- enable clang-tidy checks
                "--completion-style=bundled", -- bundled = LSP-standard completion
                "--header-insertion=never",   -- don't auto-insert headers
                "--offset-encoding=utf-16",   -- fix offset errors (esp. with cmp)
            },
            capabilities = vim.lsp.protocol.make_client_capabilities(),
            on_attach = function(_, bufnr)
                local map = function(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
                end

                map("n", "gd", vim.lsp.buf.definition, "Go to definition")
                map("n", "gr", vim.lsp.buf.references, "Find references")
                map("n", "K", vim.lsp.buf.hover, "Hover documentation")
                map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
                map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
            end,
        })
    end,
}

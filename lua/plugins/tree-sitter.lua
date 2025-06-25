return {
  "nvim-treesitter/nvim-treesitter",
  config = function()

    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "vim", "bash", "c", "cpp", "python" }, -- Add what you use
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = { enable = true },
    })
  end,
}


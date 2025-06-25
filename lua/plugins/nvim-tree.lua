return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    -- Disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      view = {
        width = 30,
        relativenumber = true,
      },
      filters = {
        dotfiles = false,
        custom = { ".git", "node_modules", ".cache" }
      },
      renderer = {
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
          },
        },
      },
    })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "NvimTree",
      callback = function()
        local api = require("nvim-tree.api")
        local opts = { buffer = true, noremap = true, silent = true }

        -- Remove default 's' mapping (important!)
        vim.keymap.set("n", "s", "", { buffer = true })

        -- Horizontal split
        vim.keymap.set("n", "s", function()
          local node = api.tree.get_node_under_cursor()
          if node and node.absolute_path then
            vim.cmd("split " .. vim.fn.fnameescape(node.absolute_path))
          else
            vim.notify("No valid file selected", vim.log.levels.WARN)
          end
        end, opts)

        -- Vertical split
        vim.keymap.set("n", "v", function()
          local node = api.tree.get_node_under_cursor()
          if node and node.absolute_path then
            vim.cmd("vsplit " .. vim.fn.fnameescape(node.absolute_path))
          else
            vim.notify("No valid file selected", vim.log.levels.WARN)
          end
        end, opts)
      end,
    })
  end,
}

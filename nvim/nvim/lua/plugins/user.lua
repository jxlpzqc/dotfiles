-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:
--
---@type LazySpec
return {
  {
    "rcarriga/nvim-notify",
    event = "UIEnter",
    opts = {
      stages = "static"
    }
  },
  {
    "github/copilot.vim",
    event = "User AstroFile",
    config = function()
      vim.cmd [[
        inoremap <silent><script><expr> <M-l> copilot#Accept("\<CR>")
      ]]
      vim.g.copilot_no_tab_map = true
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    opts = {
      mode = "topline",
    },
  },
  {
    "glepnir/lspsaga.nvim",
    event = "User AstroFile",
    config = function()
      local saga = require "lspsaga"
      saga.setup {
        ui = { border = "rounded" },
        lightbulb = { virtual_text = false },
      }
    end,
  },
}

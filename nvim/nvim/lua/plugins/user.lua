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
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    opts = {
      mode = "topline",
    },
  },
  {
    "glepnir/lspsaga.nvim",
    event = "User AstroFile",
    opts = {
      ui = { border = "rounded" },
      lightbulb = { virtual_text = false },
    }
  },
  { -- override nvim-cmp plugin
    "hrsh7th/nvim-cmp",
    -- override the options table that is used in the `require("cmp").setup()` call
    opts = function(_, opts)
      -- opts parameter is the default options table
      -- the function is lazy loaded so cmp is able to be required
      local cmp = require("cmp")
      -- modify the mapping part of the table
      opts.mapping["<Tab>"] = cmp.mapping.confirm({ select = true })
    end
  }
}

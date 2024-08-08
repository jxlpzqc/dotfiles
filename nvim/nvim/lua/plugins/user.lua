-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:
--
---@type LazySpec
return {
  {
    "rcarriga/nvim-notify",
    event = "UIEnter",
    opts = {
      stages = "static",
    },
  },
  { -- override nvim-cmp plugin
    "hrsh7th/nvim-cmp",
    -- override the options table that is used in the `require("cmp").setup()` call
    opts = function(_, opts)
      -- opts parameter is the default options table
      -- the function is lazy loaded so cmp is able to be required
      local cmp = require "cmp"
      -- modify the mapping part of the table
      opts.mapping["<Tab>"] = cmp.mapping.confirm { select = true }
      opts.experimental = { ghost_text = true }
    end,
  },
  {
    "sakhnik/nvim-gdb",
    init = function(_)
      vim.g.nvimgdb_disable_start_keymaps = 1
      vim.g.nvimgdb_config_override = {
        key_breakpoint = "<F9>",
        key_eval = "<F8>",
        sign_breakpoint_priority = 60,
        termwin_command = "vertical new",
      }
    end,
  },
}

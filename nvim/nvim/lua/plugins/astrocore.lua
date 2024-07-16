-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 2, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        cmdheight = 1,
        signcolumn = "yes", -- sets vim.opt.signcolumn to auto
        wrap = true, -- sets vim.opt.wrap
        virtualedit = "", -- disable virtualedit
        tabstop = 4,
        shiftwidth = 4,
        expandtab = true,
        background = "light"
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        -- L = {
        --   function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
        --   desc = "Next buffer",
        -- },
        -- H = {
        --   function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        --   desc = "Previous buffer",
        -- },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        ["<S-h>"] = ":bprevious<CR>",
        ["<S-l>"] = ":bnext<CR>",
        ["<Leader>o"] = { ":AerialToggle<CR>", desc = "Toggle outline" },
        ["[q"] = { ":cprevious<CR>", desc = "Previous quickfix" },
        ["]q"] = { ":cnext<CR>", desc = "Next quickfix" },
        ["<Leader>dl"] = {
          function()
            require("dap.ext.vscode").load_launchjs(nil, {
              cppdbg = { "c", "cpp", "rust" },
            })
          end,
          desc = "Load launch json",
        },
        ["gh"] = { "<cmd>Lspsaga finder<CR>", silent = true, desc = "Open finder" },
        ["gp"] = { "<cmd>Lspsaga peek_definition<CR>", silent = true, desc = "Peek definitions" },
        ["ga"] = { "<cmd>Lspsaga code_action<CR>", silent = true, desc = "Show code actions" },
        ["[e"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", silent = true },
        ["]e"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", silent = true },
        ["<M-1>"] = { "<cmd>ToggleTerm direction=horizontal<CR>", silent = true },
        ["<Leader>h"] = { "<cmd>noh<CR>", silent = true, desc = "Close hls" },

      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
    on_keys = {
      auto_hlsearch = {}
    }
  },
}

return {
  colorscheme = "vscode",
  lsp = {
    formatting = {
      format_on_save = false,
    },
  },
  options = {
    opt = {
      cmdheight = 1,
      tabstop = 4,
      shiftwidth = 4,
      expandtab = true,
    },
  },
  mappings = {
    n = {
      ["<S-h>"] = ":bprevious<CR>",
      ["<S-l>"] = ":bnext<CR>",
      ["<leader>o"] = { ":AerialToggle<CR>", desc = "Toggle outline" },
      ["[q"] = { ":cprevious<CR>", desc = "Previous quickfix" },
      ["]q"] = { ":cnext<CR>", desc = "Next quickfix" },
      ["<leader>dl"] = {
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
      ["<leader>h"] = { "<cmd>noh<CR>", silent = true, desc = "Close hls" },
    },
  },
  plugins = {
    -- community configs
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.colorscheme.vscode-nvim" },
    { import = "astrocommunity.motion.nvim-surround" },
    -- { import = "astrocommunity.motion.flash-nvim" },
    { import = "astrocommunity.motion.hop-nvim" },
    -- { import = "astrocommunity.completion.copilot-lua" },
    { import = "astrocommunity.lsp.lsp-signature-nvim" },
    { import = "astrocommunity.project.nvim-spectre" },
    { import = "astrocommunity.editing-support.todo-comments-nvim" },
    { import = "astrocommunity.editing-support.neogen" },
    { import = "astrocommunity.pack.cpp" },
    { import = "astrocommunity.pack.bash" },
    { import = "astrocommunity.pack.go" },
    { import = "astrocommunity.pack.rust" },
    { import = "astrocommunity.pack.python" },
    { import = "astrocommunity.pack.cmake" },
    { import = "astrocommunity.pack.typescript" },
    { import = "astrocommunity.diagnostics.trouble-nvim" },
    { import = "astrocommunity.git.blame-nvim" },
    { import = "astrocommunity.terminal-integration.vim-tmux-yank" },
    { import = "astrocommunity.debugging.nvim-bqf" },
    -- overrides
    { "goolord/alpha-nvim", enabled = false },
    {
      "rebelot/heirline.nvim",
      opts = function(_, opts)
        local status = require "astronvim.utils.status"
        opts.statusline = { -- statusline
          hl = { fg = "fg", bg = "bg" },
          status.component.mode { mode_text = { padding = { left = 1, right = 1 } } }, -- add the mode text
          status.component.git_branch(),
          status.component.file_info { filetype = {}, filename = false, file_modified = false },
          status.component.git_diff(),
          status.component.diagnostics(),
          status.component.fill(),
          status.component.cmd_info(),
          status.component.fill(),
          status.component.lsp(),
          status.component.treesitter(),
          status.component.nav(),
          -- remove the 2nd mode indicator on the right
        }
        return opts
      end,
    },
    -- custom plugins
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
    {
      "dhananjaylatkar/cscope_maps.nvim",
      dependencies = {
        "folke/which-key.nvim", -- optional [for whichkey hints]
        "nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
        "nvim-tree/nvim-web-devicons", -- optional [for devicons in telescope or fzf]
      },
      event = "User AstroFile",
      ft = { "c", "cpp" },
      opts = {
        prefix = "<C-c>",
        cscope = {
          picker = "quickfix",
          db_build_cmd_args = { "-bRqkv" },
        },
        -- USE EMPTY FOR DEFAULT OPTIONS
        -- DEFAULTS ARE LISTED BELOW
      },
    },
  },
  polish = function()
    -- disable clangd warning
    local notify = require("notify").notify
    ---@diagnostic disable-next-line: duplicate-set-field
    require("notify").notify = function(msg, ...)
      if msg:match "warning: multiple different client offset_encodings" then return end
      notify(msg, ...)
    end
    vim.o.background = "light"
    vim.on_key(function() end, vim.api.nvim_get_namespaces()["auto_hlsearch"])
  end,
}

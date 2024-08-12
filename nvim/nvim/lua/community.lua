-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
  { import = "astrocommunity.motion.nvim-surround" },
  -- { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.hop-nvim" },
  { import = "astrocommunity.completion.copilot-cmp" },
  -- NOTE: There is bug in community config.
  -- { import = "astrocommunity.lsp.lsp-signature-nvim" },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
  },
  { import = "astrocommunity.lsp.lspsaga-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.nvim-treesitter-context" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.bash" },
  -- { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.git.blame-nvim" },
  { import = "astrocommunity.quickfix.nvim-bqf" },
  { import = "astrocommunity.search.nvim-spectre" },
  -- reconfigure astrocommunity.search.nvim-spectre
  {
    "nvim-pack/nvim-spectre",
    opts = function(_, opts)
      if not opts.mapping then return end
      opts.mapping["resume_last_search"] = nil
      opts.mapping["replace_cmd"] = { map = "<C-c>" }
      opts.mapping["change_view_mode"] = { map = "<C-v>" }
    end,
  },
  { import = "astrocommunity.game.leetcode-nvim" },
  {
    "kawre/leetcode.nvim",
    opts = {
      cn = {
        enabled = true,
      },
      injector = {
        ["cpp"] = {
          before = { "#include <bits/stdc++.h>", "using namespace std;" },
          after = "int main() {}",
        },
        ["java"] = {
          before = "import java.util.*;",
        },
      },
    },
  },
}

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here


local function set_gnu_c()
  vim.bo.cindent = true
  vim.bo.cinoptions = "j1,f0,^-2,{2,>4,:4,n-2,(0,t0"
  vim.bo.expandtab = false
  vim.bo.shiftwidth = 2
  vim.bo.tabstop = 8

  -- disable treesitter indent
  vim.bo.indentexpr = ""
end

-- add command for gnu c
vim.api.nvim_create_user_command("GnuC", set_gnu_c, { nargs = 0 })

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }
--
-- local notify = require("notify").notify
-- ---@diagnostic disable-next-line: duplicate-set-field
-- require("notify").notify = function(msg, ...)
--   if msg:match "warning: multiple different client offset_encodings" then return end
--   notify(msg, ...)
-- end
--

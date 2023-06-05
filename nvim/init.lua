local HOME = vim.env.HOME
vim.env.LUNARVIM_RUNTIME_DIR = HOME .. "/.local/share/lunarvim"
vim.env.LUNARVIM_CONFIG_DIR = HOME .. "/.config/lvim"
vim.env.LUNARVIM_CACHE_DIR = HOME .. "/.cache/lvim"
vim.env.LUNARVIM_BASE_DIR = HOME .. "/.local/share/lunarvim/lvim"

vim.cmd("source " .. vim.env.LUNARVIM_BASE_DIR .. "/init.lua")

if vim.g.neovide then
  vim.opt.guifont = { "FiraCode NF", "h10" }
  vim.opt.linespace = 0
end

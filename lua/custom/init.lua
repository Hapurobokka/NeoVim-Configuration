local opt = vim.opt
local g = vim.g
local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})
--
--
--------------------------options-------------------------
opt.wrap = true
opt.linebreak = true
opt.foldlevel = 1

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"javascript", "html", "css"},
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
    end,
})

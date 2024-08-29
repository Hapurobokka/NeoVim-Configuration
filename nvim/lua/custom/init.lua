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
    pattern = {"javascript", "html", "css", "nix"},
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "org" },
    callback = function()
        vim.cmd "set spell"
    end
})

vim.api.nvim_set_keymap('v', '<leader>pi', [[:<C-u>lua GetImage(vim.fn.getreg('"'))<CR>]], { noremap = true, silent = true} )

local function goyo_enter()
    vim.cmd("Limelight")
end

local function goyo_leave()
    vim.cmd("Limelight!")
    vim.cmd("colorscheme kanagawa")
end

vim.api.nvim_create_autocmd("User", {
    pattern = "GoyoEnter",
    nested = true,
    callback = goyo_enter
})

vim.api.nvim_create_autocmd("User", {
    pattern = "GoyoLeave",
    nested = true,
    callback = goyo_leave
})

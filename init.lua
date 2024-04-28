require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
    dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
    require("core.bootstrap").gen_chadrc_template()
    require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

require("nvim-treesitter.configs").setup({
    ensure_installed = { "markdown", "markdown_inline", ... },
    highlight = {
        enable = true,
    },
})

require('telescope').load_extension('media_files')
require'telescope'.setup {
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      -- find command (defaults to `fd`)
      find_cmd = "rg"
    }
  },
}

require("oil").setup()

vim.cmd("set spelllang=es")

local lspconfig = require('lspconfig')
lspconfig.tsserver.setup {}
lspconfig.pylsp.setup{}


if vim.g.neovide then
    vim.o.guifont = "FiraCode Nerd Font:h12"
    -- Aquí pasan cosas de NeoVide
end

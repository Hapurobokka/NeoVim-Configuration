require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
    dofile(custom_init_path)
end

require("core.utils").load_mappings()

vim.g.maplocalleader = ","

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
    require("core.bootstrap").gen_chadrc_template()
    require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

require("nvim-treesitter.configs").setup {
    ensure_installed = { "markdown", "markdown_inline", ... },
    highlight = {
        enable = true,
    },
}

require("oil").setup()
require("image_preview").setup {}

vim.cmd "set spelllang=es"

local lspconfig = require "lspconfig"
local configs = require "lspconfig.configs"
lspconfig.tsserver.setup {}
lspconfig.pyright.setup {}
lspconfig.sqls.setup {
    settings = {
        sqls = {
            connections = {
                {
                    driver = "sqlite3",
                    dataSourceName = "/home/hapu/code/expenses-tracker/database.db",
                },
            },
        },
    },
}
-- lspconfig.clojure_lsp.setup {
--     root_dir = lspconfig.util.root_pattern(
--         "project.clj",
--         "deps.edn",
--         "build.boot",
--         "shadow-cljs.edn",
--         ".git",
--         "bb.edn"
--     ),
-- }

if vim.g.neovide then
    vim.o.guifont = "JetBrainsMono Nerd Font:h12"
    vim.g.transparency = false
    -- Aquí pasan cosas de NeoVide
end

vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")

local overrides = require "custom.configs.overrides"
package.path = package.path .. ";" .. vim.fn.expand "$HOME" .. "/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";" .. vim.fn.expand "$HOME" .. "/.luarocks/share/lua/5.1/?.lua"

---@type NvPluginSpec[]
local plugins = {

    -- Override plugin definition options

    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end, -- Override to setup mason-lspconfig
        dependencies = {
            { "ms-jpq/coq_nvim", branch = "coq" },

            -- 9000+ Snippets
            { "ms-jpq/coq.artifacts", branch = "artifacts" },
        },

        init = function()
            vim.g.coq_settings = {
                auto_start = "shut-up", -- if you want to start COQ at startup
                -- Your COQ settings here
            }
        end,
    },

    -- override plugin configs
    -- {
    --     "williamboman/mason.nvim",
    --     opts = overrides.mason,
    -- },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = overrides.treesitter,
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = overrides.nvimtree,
    },

    -- Install a plugin
    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function()
            require("better_escape").setup()
        end,
    },

    {
        "stevearc/conform.nvim",
        --  for users those who want auto-save conform + lazyloading!
        -- event = "BufWritePre"
        config = function()
            require "custom.configs.conform"
        end,
    },

    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        config = function()
            require("kanagawa").setup {
                compile = false, -- enable compiling the colorscheme
                undercurl = true, -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = true },
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = false, -- do not set background color
                dimInactive = false, -- dim inactive window `:h hl-NormalNC`
                terminalColors = true, -- define vim.g.terminal_color_{0,17}
                colors = { -- add/modify theme and palette colors
                    palette = {},
                    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
                },
                theme = "lotus", -- Load "wave" theme when 'background' option is not set
            }
        end,
    },

    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        opts = function()
            return require "custom.configs.zen_mode"
        end,
    },

    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
        --   "BufReadPre path/to/my-vault/**.md",
        --   "BufNewFile path/to/my-vault/**.md",
        -- },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",
        },
        opts = function()
            return require "custom.configs.obsidian"
        end,
    },

    {
        "epwalsh/pomo.nvim",
        version = "*", -- Recommended, use latest release instead of latest commit
        lazy = true,
        cmd = { "TimerStart", "TimerRepeat" },
        dependencies = {
            -- Optional, but highly recommended if you want to use the "Default" timer
            "rcarriga/nvim-notify",
        },
        opts = {
            preferred_link_style = "markdown",
        },
    },

    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
    },

    -- {
    --     "williamboman/mason-lspconfig.nvim",
    -- },

    -- {
    --     "iamcco/markdown-preview.nvim",
    --     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    --     ft = { "markdown" },
    --     build = function()
    --         vim.fn["mkdp#util#install"]()
    --     end,
    -- },

    -- {
    --     "preservim/vim-pencil",
    --     cmd = { "Pencil", "NoPencil", "TooglePencil", "SoftPencil", "HardPencil" },
    -- },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup {
                -- Configuration here, or leave empty to use defaults
            }
        end,
    },

    {
        "vhyrro/luarocks.nvim",
        priority = 1001, -- this plugin needs to run before anything else
        config = true,
        opts = {
            rocks = { "magick" },
        },
    },

    {
        "nvim-neorg/neorg",
        dependencies = { "luarocks.nvim" },
        lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = "*", -- Pin Neorg to the latest stable release
        config = function()
            return require "custom.configs.neorg"
        end,
    },

    -- {
    --     "monkoose/nvlime",
    --     ft = { "lisp" },
    --     dependencies = {
    --         "monkoose/parsley",
    --     },
    --     init = function()
    --         vim.g.nvlime_config = {
    --             leader = "<LocalLeader>",
    --             implementation = "sbcl",
    --             user_contrib_initializers = nil,
    --             autodoc = {
    --                 enabled = false,
    --                 max_level = 5,
    --                 max_lines = 50,
    --             },
    --             main_window = {
    --                 position = "right",
    --                 size = "",
    --             },
    --             floating_window = {
    --                 border = "single",
    --                 scroll_step = 3,
    --             },
    --             cmp = { enabled = true },
    --             arglist = { enabled = true },
    --         }
    --     end,
    -- },

    {
        "kovisoft/paredit",
    },

    -- {
    --     "ellisonleao/glow.nvim",
    --     config = true,
    --     cmd = "Glow",
    -- },

    {
        "nvim-telescope/telescope-media-files.nvim",
        "nvim-lua/popup.nvim",
    },

    {
        "stevearc/oil.nvim",
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "NeogitOrg/neogit",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed, not both.
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = true,
    },

    -- {
    --     "seandewar/nvimesweeper",
    --     cmd = "Nvimesweeper",
    -- },

    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },

    {
        "ggandor/leap.nvim",
        lazy = false,
        dependencies = { "tpope/vim-repeat" },
        config = function()
            require("leap").setup {
                highlight_unlabeled_phase_one_targets = true,
            }
        end,
    },

    {
        "lervag/vimtex",
        lazy = false, -- we don't want to lazy load VimTeX
        init = function()
            -- VimTeX configuration goes here
        end,
    },

    {
        "nvim-orgmode/orgmode",
        event = "VeryLazy",
        ft = { "org" },
        config = function()
            return require "custom.configs.orgmode"
        end,
    },

    -- To make a plugin not be loaded
    -- {
    --   "NvChad/nvim-colorizer.lua",
    --   enabled = false
    -- },

    -- All NvChad plugins are lazy-loaded by default
    -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
    -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
    -- {
    --   "mg979/vim-visual-multi",
    --   lazy = false,
    -- }
    --

    {
        "Olical/conjure",
        ft = { "clojure", "fennel", "python", "lisp" }, -- etc
        config = function(_, opts)
            require("conjure.main").main()
            require("conjure.mapping")["on-filetype"]()
        end,
        init = function()
            -- Set configuration options here
            vim.g["conjure#debug"] = false
            vim.g["conjure#mapping#doc_word"] = false
        end,
    },

    {
        "clojure-vim/vim-jack-in",
        dependencies = {
            "radenling/vim-dispatch-neovim",
            "tpope/vim-dispatch",
        },
        ft = { "clojure" },
    },

    {
        "adelarsq/image_preview.nvim",
        event = "VeryLazy",
        config = function()
            require("image_preview").setup()
        end,
    },

    {
        "OXY2DEV/markview.nvim",
        lazy = false, -- Recommended
        -- ft = "markdown" -- If you decide to lazy-load anyway

        dependencies = {
            -- You will not need this if you installed the
            -- parsers manually
            -- Or if the parsers are in your $RUNTIMEPATH
            "nvim-treesitter/nvim-treesitter",

            "nvim-tree/nvim-web-devicons",
        },
    },

    {
        "gpanders/nvim-parinfer",
        ft = { "clojure", "fennel", "lisp" },
    },

    {
        "jbyuki/nabla.nvim",
    },

    {
        "ludovicchabant/vim-gutentags",
        ft = { 'python', 'lua' },
        cond = function ()
            local is_git_repo = vim.fn.system('git rev-parse --is-inside-work-tree'):match('true')
            return is_git_repo ~= nil
        end
    },

    {
        "pocco81/true-zen.nvim",
        config = function()
            require('true-zen').setup{}
        end
    },

    {
        "junegunn/limelight.vim",
        cmd = "Limelight"
    }
}

vim.cmd "let g:vimtex_view_general_viewer = 'okular.exe'"
vim.cmd "let g:limelight_conceal_ctermfg = 240"

return plugins

local opts = {}

opts = {
    workspaces = {
        {
            name = "aire",
            path = "/mnt/c/Users/cosmo/OneDrive/Documents/aire",
            overrides = {
                templates = {
                    subdir = "/Plantillas",
                },
            },
        },

        {
            name = "vault",
            path = "/mnt/c/Users/cosmo/OneDrive/Documents/vault/",
        },

        {
            name = "no-vault",
            path = function()
                -- alternatively use the CWD:
                -- return assert(vim.fn.getcwd())
                return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
            end,
            overrides = {
                notes_subdir = vim.NIL, -- have to use 'vim.NIL' instead of 'nil'
                new_notes_location = "current_dir",
                templates = {
                    subdir = vim.NIL,
                },
                disable_frontmatter = true,
            },
        },
    },

    ui = {
        enable = false,
    },
    -- Optional, customize how note IDs are generated given an optional title.
    ---@param title string
    ---@return string
    note_id_func = function(title)
        return title
    end,
}

return opts

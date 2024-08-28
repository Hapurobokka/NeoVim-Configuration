local opts = {}

opts = {
    require("neorg").setup {
        load = {
            ["core.defaults"] = {},
            ["core.concealer"] = {},
            ["core.dirman"] = {
                config = {
                    workspaces = {
                        notes = "~/org",
                        escuela = "~/escuela",
                        escritura = "~/escritura",
                    },
                    default_workspace = "notes",
                },
            },
            ["core.export"] = {},
        },
    },
}

return opts

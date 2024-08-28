local orgmode = require "orgmode"
local opts = {}

-- Setup orgmode

-- NOTE: If you are using nvim-treesitter with `ensure_installed = "all"` option
-- add `org` to ignore_install
-- require('nvim-treesitter.configs').setup({
--   ensure_installed = 'all',
--   ignore_install = { 'org' },
-- })

opts = {
    orgmode.setup {
        org_agenda_files = "~/orgfiles/**/*",
        org_default_notes_file = "~/orgfiles/cosas_que_hacer.org",
        org_capture_templates = {
            j = {
                description = "Journal",
                template = "\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?",
                target = "~/orgfiles/journal.org",
            },
        },
        org_custom_exports = {
            -- this uses a custom bash script
            r = {
                label = "Actually funcional and stupid org to pdf export",
                action = function(exporter)
                    local current_file = vim.api.nvim_buf_get_name(0)
                    local target = vim.fn.fnamemodify(current_file, ":p:r") .. ".pdf"
                    local command = { "export-org-to-pdf", current_file }
                    local on_sucess = function(output)
                        print "Sucess!"
                        vim.api.nvim_echo({ { table.concat(output, "\n") } }, true, {})
                    end
                    local on_error = function(err)
                        print "Error!"
                        vim.api.nvim_echo({ { table.concat(err, "\n"), "ErrorMsg" } }, true, {})
                    end
                    return exporter(command, target, on_sucess, on_error)
                end,
            },
        },
    },
}

return opts

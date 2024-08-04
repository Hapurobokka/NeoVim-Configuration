---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>fo"] = { "<cmd>Oil<cr>", "Open Oil"},

    -- Para Telescope
    ["<leader>fi"] = { "<cmd>Telescope media_files<cr>", "Searches media files" },

    -- Entra al modo escritura
    ["<leader>aw"] = { "<cmd>WritingMode<cr>", "enter writing mode" },

    -- Atajos de Neorg
    ["<leader>ani"] = { "<cmd>Neorg index<cr>", "Opens default's workspace index file" },
    ["<leader>anjt"] = { "<cmd>Neorg journal today<cr>", "Opens today's note" },
    ["<leader>anjy"] = { "<cmd>Neorg journal yesterday<cr>", "Opens yesterday's note" },
    ["<leader>anjo"] = { "<cmd>Neorg journal tomorrow<cr>", "Opens tomorrow's note" },
    ["<leader>anmh"] = {"<cmd>Neorg mode traverse-heading<cr>", "Traversal heading mode" },
    ["<leader>anmn"] = {"<cmd>Neorg mode norg<cr>", "Normal Neorg mode" },
    ["<leader>anml"] = {"<cmd>Neorg mode traverse-link<cr>", "Traversal link mode" },

    -- Aquí comienzan los mappings de Obsidian
    ["<leader>aot"] = { "<cmd>ObsidianTags<cr>", "Checks Obsidian tags"},
    ["<leader>aob"] = { "<cmd>ObsidianBacklinks<cr>", "Open this file's backlinks"},
    ["<leader>aol"] = { "<cmd>ObsidianLinks<cr>", "Open this file's links"},
    ["<leader>aoe"] = { "<cmd>ObsidianTemplates<cr>", "Insert a template"},
    ["<leader>aos"] = { "<cmd>ObsidianSearch<cr>", "Search for a note in the vault" },
    ["<leader>aor"] = { "<cmd>ObsidianRename<cr>", "Rename current note" },
    ["<leader>aoi"] = { "<cmd>ObsidianLinkNew<cr>", "Create a new link at a selection"},

    ["<leader>gg"] = {"<cmd>Neogit<cr>", "Open Neogit"},

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!

return M

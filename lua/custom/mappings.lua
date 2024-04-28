---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>o"] = { "<cmd>Oil<cr>", "Open Oil"},

    -- Para Telescope
    ["fi"] = { "<cmd>Telescope media_files<cr>", "Searches media files" },

    -- Entra al modo escritura
    ["<leader>aw"] = { "<cmd>WritingMode<cr>", "enter writing mode" },

    -- Aquí comienzan los mappings de Obsidian
    ["<leader>aot"] = { "<cmd>ObsidianTags<cr>", "Checks Obsidian tags"},

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

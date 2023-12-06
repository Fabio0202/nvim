
-- setze den hotkey auf leertaste + o
vim.api.nvim_set_keymap('n', '<leader>o', ':Neotree toggle<CR>', { noremap = true, silent = true, desc = '󰒺 Öffne Side Menu' })




return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },

    -- uninteressant von hier an
  init = function() vim.g.neo_tree_remove_legacy_commands = true end,
opts = {
    auto_clean_after_session_restore = true,
    close_if_last_window = true,
    window = {
      mappings = {
        ["<space>"] = false, 
      }
    }
  }
}



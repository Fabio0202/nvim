local my_custom_theme = require 'fabio.plugins-folder.startup-theme.startup-theme' -- Adjust the path as needed

return {


  {
    'ahmedkhalf/project.nvim',
    config = function(_, opts)
      require('project_nvim').setup(opts)
    end,
    opts = {
      ignore_lsp = { 'lua_ls' },
    },
  },
  -- SESSION MANAGER SETUP
  {
    'Shatur/neovim-session-manager',

    config = function()
      require('session_manager').setup {

        vim.keymap.set({ 'n' }, '<leader>S', require('session_manager').load_session),
--        vim.keymap.set({ 'n' }, '<leader>fS', require('session_manager').load_session),
--        vim.keymap.set({ 'n' }, '<leader>Sd', require('session_manager').delete_session),
--        vim.keymap.set({ 'n' }, '<leader>fD', require('session_manager').delete_session),
--        vim.keymap.set({ 'n' }, '<leader>Sl', require('session_manager').load_last_session),
--        vim.keymap.set({ 'n' }, '<leader>Sc', require('session_manager').load_current_dir_session),

      }
    end
  },

  -- STARTUP WINDOW SETUP
  {
    "startup-nvim/startup.nvim",

    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim",

      'nvim-telescope/telescope-project.nvim',
    },

    config = function()
      local telescope = require 'telescope'
      -- Set up mappings for session manager
      require "startup".create_mappings({
        ["S"] = ":lua require('session_manager').load_session()<CR>",
        ["C"] = ":lua require('session_manager').load_current_dir_session()<CR>",
        ["L"] = ":lua require('session_manager').load_last_session()<CR>",

        ["N"] = ":lua require('startup').new_file()<CR>",
        ["O"] = ":lua require('telescope.builtin').oldfiles()<CR>",
        ["Q"] = ":q<CR>",

      })


      -- SETTING UP MY CUSTOM THEME
      require("startup").setup(

        my_custom_theme


      )
    end
  } }
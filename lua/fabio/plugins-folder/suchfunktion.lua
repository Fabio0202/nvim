return {

  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/plenary.nvim',

  },

  -- Telescope configuration
  opts = function()

    local actions = require 'telescope.actions'
    local telescope = require 'telescope'
    
    telescope.load_extension('ui-select')
    telescope.setup {
      defaults = {
        prompt_prefix = 'Search ',
        selection_caret = 'Selected ',
        path_display = { 'truncate' },
        sorting_strategy = 'ascending',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            preview_width = 0.55,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        mappings = {
          i = {
            ['<C-n>'] = actions.cycle_history_next,
            ['<C-p>'] = actions.cycle_history_prev,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-q>'] = actions.close,
          },
          n = {
            ['q'] = actions.close,
            ['<leader>q'] = actions.close,
          },
        },
      },
    }

    -- Load extensions
  end,
}

-- For init.lua
        --
if vim.g.neovide then
  vim.api.nvim_set_keymap('n', '<Tab>', '>>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<S-Tab>', '<<', { noremap = true, silent = true })
  -- vim.g.neovide_transparency = 0.95
  vim.cmd [[set guifont=MonoLisa:10,Symbols\ Nerd\ Font:h10]]

  -- Insert mode mappings for Alt + H and Alt + K
  vim.api.nvim_set_keymap('i', '<A-h>', '<Left>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('i', '<A-l>', '<Right>', { noremap = true, silent = true })
  vim.g.neovide_transparency = 0.9
  -- vim.g.transparency = 0.80
  vim.g.neovide_cursor_vfx_mode = 'wireframe'
end


require "fabio.options"

require "fabio.plugins"

-- vim.cmd 'colorscheme sonokai'
-- vim.cmd 'colorscheme kanagawa'
-- vim.cmd 'colorscheme rose-pine'
-- vim.cmd 'colorscheme gruvbox'
-- vim.cmd 'colorscheme catppuccin'
-- vim.cmd 'colorscheme miramare'
-- vim.cmd 'colorscheme nightfox'
-- vim.cmd 'colorscheme gruvbox-material'
-- vim.cmd 'colorscheme tokyonight'
vim.cmd 'colorscheme everforest'

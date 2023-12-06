
-- hier findest du die keybinds fuer die suchfunktion
vim.api.nvim_set_keymap('n', '<leader>sa', ':Telescope oldfiles<CR>', { noremap = true, silent = true, desc = 'Suche Alt - zuletzt geoeffneten dateien' })
vim.api.nvim_set_keymap('n', '<leader>sf', ':Telescope find_files<CR>', { noremap = true, silent = true, desc = 'Suche Files - dateien im Folder' })
vim.api.nvim_set_keymap('n', '<leader>st', ':TodoTelescope<CR>', { noremap = true, silent = true, desc = 'Suche Todos - Stellen die mit %TODO markiert sind' })
vim.api.nvim_set_keymap( 'n', '<leader>sb', "<cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true, silent = true, desc = '󰓩  Suche in offenen Tabs' })
return {}

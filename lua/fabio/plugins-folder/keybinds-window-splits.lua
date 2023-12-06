-- mit diesem plugin kannst du Control + hjkl verwenden um dich in den fenstern herumzubewegen


-- hier mappe ich fenster splitten auf | und \
vim.api.nvim_set_keymap('n', '°', '<cmd>vsplit<CR>', { noremap = true, silent = true, desc = 'Vertical Split' })
vim.api.nvim_set_keymap('n', '\\', '<cmd>split<CR>', { noremap = true, silent = true, desc = 'Horizontal Split' })
-- Move to split
vim.api.nvim_set_keymap('n', '<C-h>', '<cmd>lua require("smart-splits").move_cursor_left()<CR>', { noremap = true, silent = true, desc = 'Move to left split' })
vim.api.nvim_set_keymap('n', '<C-j>', '<cmd>lua require("smart-splits").move_cursor_down()<CR>', { noremap = true, silent = true, desc = 'Move to below split' })
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua require("smart-splits").move_cursor_up()<CR>', { noremap = true, silent = true, desc = 'Move to above split' })
vim.api.nvim_set_keymap('n', '<C-l>', '<cmd>lua require("smart-splits").move_cursor_right()<CR>', { noremap = true, silent = true, desc = 'Move to right split' })

-- Resize split
vim.api.nvim_set_keymap('n', '<C-Up>', '<cmd>lua require("smart-splits").resize_up()<CR>', { noremap = true, silent = true, desc = 'Resize split up' })
vim.api.nvim_set_keymap('n', '<C-Down>', '<cmd>lua require("smart-splits").resize_down()<CR>', { noremap = true, silent = true, desc = 'Resize split down' })
vim.api.nvim_set_keymap('n', '<C-Left>', '<cmd>lua require("smart-splits").resize_left()<CR>', { noremap = true, silent = true, desc = 'Resize split left' })
vim.api.nvim_set_keymap('n', '<C-Right>', '<cmd>lua require("smart-splits").resize_right()<CR>', { noremap = true, silent = true, desc = 'Resize split right' })

  
  return {'mrjones2014/smart-splits.nvim'}
